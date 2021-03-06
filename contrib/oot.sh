#!/bin/bash
# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Update out-of-tree projects from oot.txt
# Each one is cloned in the oot/ directory.


# Update the directory
update_oot() {
	if test -d "$dir"; then
		echo "$name: git pull"
		../misc/jenkins/unitrun.sh "cmd-$name-pull" git --work-tree="$PWD/$dir" --git-dir="$PWD/$dir/.git" pull -f
	else
		echo "$name: git clone"
		../misc/jenkins/unitrun.sh "cmd-$name-clone" git clone "$repo" "$dir"
	fi
}

# Run trymake with arguments
trymake_oot() {
	echo "$name: trymake $@"
	../misc/jenkins/trymake.sh "$name" "$dir" "$@"
}

cmd="$1"
shift

while read -r repo name; do
	[[ "$repo" = "#"* ]] && continue
	[[ "$name" = "" ]] && continue
	dir="oot/$name"
	case "$cmd" in
		list) echo "$name";;
		update) update_oot;;
		trymake) trymake_oot "$@";;
		pre-build) trymake_oot pre-build;;
		all) update_oot; trymake_oot pre-build all check;;
		""|help) echo "usage: oot.sh command [arg...]"; exit 0;;
		*) echo >&2 "unknown command: $cmd"; exit 1;;
	esac
done < oot.txt
