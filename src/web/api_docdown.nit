# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Nitdoc specific Markdown format handling for Nitweb
module api_docdown

import api_graph
intrude import doc_down
intrude import markdown::wikilinks
import doc_commands
import model::model_index

redef class NitwebConfig
	# Specific Markdown processor to use within Nitweb
	var md_processor: MarkdownProcessor is lazy do
		var proc = new MarkdownProcessor
		proc.emitter.decorator = new NitwebDecorator(view, modelbuilder)
		return proc
	end
end

redef class APIRouter
	redef init do
		super
		use("/docdown/", new APIDocdown(config))
	end
end

# Docdown handler accept docdown as POST data and render it as HTML
class APIDocdown
	super APIHandler

	redef fun post(req, res) do
		res.html config.md_processor.process(req.body)
	end
end

# Specific Markdown decorator for Nitweb
#
# We reuse all the implementation of the NitdocDecorator and add the wikilinks handling.
class NitwebDecorator
	super NitdocDecorator

	# View used by wikilink commands to find model entities
	var view: ModelView

	# Modelbuilder used to access code
	var modelbuilder: ModelBuilder

	redef fun add_span_code(v, buffer, from, to) do
		var text = new FlatBuffer
		buffer.read(text, from, to)
		var name = text.write_to_string
		name = name.replace("nullable ", "")
		var mentity = try_find_mentity(view, name)
		if mentity == null then
			super
		else
			v.add "<code>"
			v.write_mentity_link(mentity, text.write_to_string)
			v.add "</code>"
		end
	end

	private fun try_find_mentity(view: ModelView, text: String): nullable MEntity do
		var mentity = view.mentity_by_full_name(text)
		if mentity != null then return mentity

		var mentities = view.mentities_by_name(text)
		if mentities.is_empty then
			return null
		else if mentities.length > 1 then
			# TODO smart resolve conflicts
		end
		return mentities.first
	end

	redef fun add_wikilink(v, token) do
		var link = token.link
		if link == null then return
		var cmd = new DocCommand(link.write_to_string)
		cmd.render(v, token, view)
	end
end

# Same as `InlineDecorator` but with wikilink commands handling
class NitwebInlineDecorator
	super InlineDecorator

	# View used by wikilink commands to find model entities
	var view: ModelView

	# Modelbuilder used to access code
	var modelbuilder: ModelBuilder

	redef fun add_wikilink(v, token) do
		var link = token.link
		if link == null then return
		var cmd = new DocCommand(link.write_to_string)
		cmd.render(v, token, view)
	end
end

redef class MarkdownEmitter
	# Find the MEntity that matches `name`.
	#
	# Write an error if the entity is not found
	fun find_mentity(model: ModelView, name: nullable String): nullable MEntity do
		if name == null then
			write_error("No MEntity found")
			return null
		end
		# Lookup by full name
		var mentity = model.mentity_by_full_name(name)
		if mentity != null then return mentity

		var mentities = model.mentities_by_name(name)
		if mentities.is_empty then
			var suggest = model.find(name, 3)
			var msg = new Buffer
			msg.append "No MEntity found for name `{name}`"
			if suggest.not_empty then
				msg.append " (suggestions: "
				var i = 0
				for s in suggest do
					msg.append "`{s.full_name}`"
					if i < suggest.length - 1 then msg.append ", "
					i += 1
				end
				msg.append ")"
			end
			write_error(msg.write_to_string)
			return null
		else if mentities.length > 1 then
			var msg = new Buffer
			msg.append "Conflicts for name `{name}`"
			msg.append " (conflicts: "
			var i = 0
			for s in mentities do
				msg.append "`{s.full_name}`"
				if i < mentities.length - 1 then msg.append ", "
				i += 1
			end
			msg.append ")"
			write_warning(msg.write_to_string)
		end
		return mentities.first
	end

	# Write a warning in the output
	fun write_warning(text: String) do
		emit_text "<p class='text-warning'>Warning: {text}</p>"
	end

	# Write an error in the output
	fun write_error(text: String) do
		emit_text "<p class='text-danger'>Error: {text}</p>"
	end

	# Write a link to a mentity in the output
	fun write_mentity_link(mentity: MEntity, text: nullable String) do
		var link = mentity.web_url
		var name = text or else mentity.name
		var mdoc = mentity.mdoc_or_fallback
		var comment = null
		if mdoc != null then comment = mdoc.synopsis
		decorator.add_link(self, link, name, comment)
	end

	# Write a mentity list in the output
	fun write_mentity_list(mentities: Collection[MEntity]) do
		add "<ul>"
		for mentity in mentities do
			var mdoc = mentity.mdoc_or_fallback
			add "<li>"
			write_mentity_link(mentity)
			if mdoc != null then
				add " - "
				emit_text mdoc.synopsis
			end
			add "</li>"
		end
		add "</ul>"
	end
end

redef interface DocCommand

	# Emit the HTML related to the execution of this doc command
	fun render(v: MarkdownEmitter, token: TokenWikiLink, model: ModelView) do
		v.write_error("Not yet implemented command `{token.link or else "null"}`")
	end
end

redef class UnknownCommand
	redef fun render(v, token, model) do
		var link = token.link
		if link == null then
			v.write_error("Empty command")
			return
		end
		var full_name = link.write_to_string
		var mentity = v.find_mentity(model, full_name)
		if mentity == null then return
		v.write_mentity_link(mentity)
	end
end

redef class ArticleCommand
	redef fun render(v, token, model) do
		if args.is_empty then
			v.write_error("Expected one arg: the MEntity name")
			return
		end
		var name = args.first
		var mentity = v.find_mentity(model, name)
		if mentity == null then return
		var mdoc = mentity.mdoc_or_fallback
		if mdoc == null then
			v.write_warning("No MDoc for mentity `{name}`")
			return
		end
		v.add "<h3>"
		v.write_mentity_link(mentity)
		v.add " - "
		v.emit_text mdoc.synopsis
		v.add "</h3>"
		v.add v.processor.process(mdoc.comment).write_to_string
	end
end

redef class CommentCommand
	redef fun render(v, token, model) do
		if args.is_empty then
			v.write_error("Expected one arg: the MEntity name")
			return
		end
		var name = args.first
		var mentity = v.find_mentity(model, name)
		if mentity == null then return
		var mdoc = mentity.mdoc_or_fallback
		if mdoc == null then
			v.write_warning("No MDoc for mentity `{name}`")
			return
		end
		v.add v.processor.process(mdoc.comment).write_to_string
	end
end

redef class ListCommand
	redef fun render(v, token, model) do
		if args.is_empty then
			v.write_error("Expected one arg: the MEntity name")
			return
		end
		var name = args.first
		var mentity = v.find_mentity(model, name)
		if mentity == null then return
		if mentity isa MPackage then
			v.write_mentity_list(mentity.mgroups)
		else if mentity isa MGroup then
			var res = new Array[MEntity]
			res.add_all mentity.in_nesting.smallers
			res.add_all mentity.mmodules
			v.write_mentity_list(res)
		else if mentity isa MModule then
			v.write_mentity_list(mentity.mclassdefs)
		else if mentity isa MClass then
			v.write_mentity_list(mentity.collect_intro_mproperties(model))
		else if mentity isa MClassDef then
			v.write_mentity_list(mentity.mpropdefs)
		else if mentity isa MProperty then
			v.write_mentity_list(mentity.mpropdefs)
		else
			v.write_error("No list found for name `{name}`")
		end
	end
end

redef class CodeCommand
	redef fun render(v, token, model) do
		if args.is_empty then
			v.write_error("Expected one arg: the MEntity name")
			return
		end
		var name = args.first
		var mentity = v.find_mentity(model, name)
		if mentity == null then return
		if mentity isa MClass then mentity = mentity.intro
		if mentity isa MProperty then mentity = mentity.intro
		var source = render_source(mentity, v.decorator.as(NitwebDecorator).modelbuilder)
		if source == null then
			v.write_error("No source for MEntity `{name}`")
			return
		end
		v.add "<pre>"
		v.add source
		v.add "</pre>"
	end

	# Highlight `mentity` source code.
	private fun render_source(mentity: MEntity, modelbuilder: ModelBuilder): nullable HTMLTag do
		var node = modelbuilder.mentity2node(mentity)
		if node == null then return null
		var hl = new HighlightVisitor
		hl.enter_visit node
		return hl.html
	end
end

redef class GraphCommand
	redef fun render(v, token, model) do
		if args.is_empty then
			v.write_error("Expected one arg: the MEntity name")
			return
		end
		var name = args.first
		var mentity = v.find_mentity(model, name)
		if mentity == null then return
		var g = new InheritanceGraph(mentity, model)
		v.add g.draw(3, 3).to_svg
	end
end

redef class Text
	# Read `self` between `nstart` and `nend` (excluded) and writte chars to `out`.
	private fun read(out: FlatBuffer, nstart, nend: Int): Int do
		var pos = nstart
		while pos < length and pos < nend do
			out.add self[pos]
			pos += 1
		end
		if pos == length then return -1
		return pos
	end
end
