# Raw AST node hierarchy.
# This file was generated by SableCC (http://www.sablecc.org/).
module parser_abs is no_warning("missing-doc")

import location

class TEol
	super Token
end
class TComment
	super Token
end
class TKwpackage
	super Token
end
class TKwmodule
	super Token
end
class TKwimport
	super Token
end
class TKwclass
	super Token
end
class TKwabstract
	super Token
end
class TKwinterface
	super Token
end
class TKwenum
	super Token
end
class TKwend
	super Token
end
class TKwmeth
	super Token
end
class TKwtype
	super Token
end
class TKwinit
	super Token
end
class TKwredef
	super Token
end
class TKwis
	super Token
end
class TKwdo
	super Token
end
class TKwvar
	super Token
end
class TKwextern
	super Token
end
class TKwpublic
	super Token
end
class TKwprotected
	super Token
end
class TKwprivate
	super Token
end
class TKwintrude
	super Token
end
class TKwif
	super Token
end
class TKwthen
	super Token
end
class TKwelse
	super Token
end
class TKwwhile
	super Token
end
class TKwloop
	super Token
end
class TKwfor
	super Token
end
class TKwin
	super Token
end
class TKwand
	super Token
end
class TKwor
	super Token
end
class TKwnot
	super Token
end
class TKwimplies
	super Token
end
class TKwreturn
	super Token
end
class TKwcontinue
	super Token
end
class TKwbreak
	super Token
end
class TKwabort
	super Token
end
class TKwassert
	super Token
end
class TKwnew
	super Token
end
class TKwisa
	super Token
end
class TKwonce
	super Token
end
class TKwsuper
	super Token
end
class TKwself
	super Token
end
class TKwtrue
	super Token
end
class TKwfalse
	super Token
end
class TKwnull
	super Token
end
class TKwas
	super Token
end
class TKwnullable
	super Token
end
class TKwisset
	super Token
end
class TKwlabel
	super Token
end
class TKwwith
	super Token
end
class TKwdebug
	super Token
end
class TOpar
	super Token
end
class TCpar
	super Token
end
class TObra
	super Token
end
class TCbra
	super Token
end
class TComma
	super Token
end
class TColumn
	super Token
end
class TQuad
	super Token
end
class TAssign
	super Token
end
class TPluseq
	super Token
end
class TMinuseq
	super Token
end
class TStareq
	super Token
end
class TSlasheq
	super Token
end
class TPercenteq
	super Token
end
class TStarstareq
	super Token
end
class TPipeeq
	super Token
end
class TCareteq
	super Token
end
class TAmpeq
	super Token
end
class TLleq
	super Token
end
class TGgeq
	super Token
end
class TDotdotdot
	super Token
end
class TDotdot
	super Token
end
class TDot
	super Token
end
class TPlus
	super Token
end
class TMinus
	super Token
end
class TStar
	super Token
end
class TStarstar
	super Token
end
class TSlash
	super Token
end
class TPercent
	super Token
end
class TPipe
	super Token
end
class TCaret
	super Token
end
class TAmp
	super Token
end
class TTilde
	super Token
end
class TEq
	super Token
end
class TNe
	super Token
end
class TLt
	super Token
end
class TLe
	super Token
end
class TLl
	super Token
end
class TGt
	super Token
end
class TGe
	super Token
end
class TGg
	super Token
end
class TStarship
	super Token
end
class TBang
	super Token
end
class TAt
	super Token
end
class TClassid
	super Token
end
class TId
	super Token
end
class TAttrid
	super Token
end
class TNumber
	super Token
end
class THexNumber
	super Token
end
class TFloat
	super Token
end
class TString
	super Token
end
class TStartString
	super Token
end
class TMidString
	super Token
end
class TEndString
	super Token
end
class TChar
	super Token
end
class TBadString
	super Token
end
class TBadChar
	super Token
end
class TExternCodeSegment
	super Token
end
class EOF
	super Token
end
class AError
	super EOF
end
class ALexerError
	super AError
end
class AParserError
	super AError
end

class AModule super Prod end
class AModuledecl super Prod end
class AImport super Prod end
class AVisibility super Prod end
class AClassdef super Prod end
class AClasskind super Prod end
class AFormaldef super Prod end
class APropdef super Prod end
class AMethid super Prod end
class ASignature super Prod end
class AParam super Prod end
class AType super Prod end
class ALabel super Prod end
class AExpr super Prod end
class AExprs super Prod end
class AAssignOp super Prod end
class AModuleName super Prod end
class AExternCalls super Prod end
class AExternCall super Prod end
class AInLanguage super Prod end
class AExternCodeBlock super Prod end
class AQualified super Prod end
class ADoc super Prod end
class AAnnotations super Prod end
class AAnnotation super Prod end
class AAtid super Prod end

class AModule
	super AModule
	var n_moduledecl: nullable AModuledecl = null is writable
	var n_imports: List[AImport] = new List[AImport]
	var n_extern_code_blocks: List[AExternCodeBlock] = new List[AExternCodeBlock]
	var n_classdefs: List[AClassdef] = new List[AClassdef]
end
class AModuledecl
	super AModuledecl
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_kwmodule: TKwmodule is writable, noinit
	var n_name: AModuleName is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AStdImport
	super AImport
	var n_visibility: AVisibility is writable, noinit
	var n_kwimport: TKwimport is writable, noinit
	var n_name: AModuleName is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ANoImport
	super AImport
	var n_visibility: AVisibility is writable, noinit
	var n_kwimport: TKwimport is writable, noinit
	var n_kwend: TKwend is writable, noinit
end
class APublicVisibility
	super AVisibility
	var n_kwpublic: nullable TKwpublic = null is writable
end
class APrivateVisibility
	super AVisibility
	var n_kwprivate: TKwprivate is writable, noinit
end
class AProtectedVisibility
	super AVisibility
	var n_kwprotected: TKwprotected is writable, noinit
end
class AIntrudeVisibility
	super AVisibility
	var n_kwintrude: TKwintrude is writable, noinit
end
class AStdClassdef
	super AClassdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_classkind: AClasskind is writable, noinit
	var n_id: nullable TClassid = null is writable
	var n_formaldefs: List[AFormaldef] = new List[AFormaldef]
	var n_extern_code_block: nullable AExternCodeBlock = null is writable
	var n_propdefs: List[APropdef] = new List[APropdef]
	var n_kwend: TKwend is writable, noinit
end
class ATopClassdef
	super AClassdef
	var n_propdefs: List[APropdef] = new List[APropdef]
end
class AMainClassdef
	super AClassdef
	var n_propdefs: List[APropdef] = new List[APropdef]
end
class AConcreteClasskind
	super AClasskind
	var n_kwclass: TKwclass is writable, noinit
end
class AAbstractClasskind
	super AClasskind
	var n_kwabstract: TKwabstract is writable, noinit
	var n_kwclass: TKwclass is writable, noinit
end
class AInterfaceClasskind
	super AClasskind
	var n_kwinterface: TKwinterface is writable, noinit
end
class AEnumClasskind
	super AClasskind
	var n_kwenum: TKwenum is writable, noinit
end
class AExternClasskind
	super AClasskind
	var n_kwextern: TKwextern is writable, noinit
	var n_kwclass: nullable TKwclass = null is writable
end
class AFormaldef
	super AFormaldef
	var n_id: TClassid is writable, noinit
	var n_type: nullable AType = null is writable
	var n_annotations: nullable AAnnotations = null is writable
end
class AAttrPropdef
	super APropdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_kwvar: TKwvar is writable, noinit
	var n_id2: TId is writable, noinit
	var n_type: nullable AType = null is writable
	var n_expr: nullable AExpr = null is writable
	var n_annotations: nullable AAnnotations = null is writable
	var n_block: nullable AExpr = null is writable
end
class AMainMethPropdef
	super APropdef
	var n_kwredef: nullable TKwredef = null is writable
	var n_block: nullable AExpr = null is writable
end
class ATypePropdef
	super APropdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_kwtype: TKwtype is writable, noinit
	var n_id: TClassid is writable, noinit
	var n_type: AType is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AMethPropdef
	super APropdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_kwmeth: nullable TKwmeth = null is writable
	var n_kwinit: nullable TKwinit = null is writable
	var n_kwnew: nullable TKwnew = null is writable
	var n_methid: nullable AMethid = null is writable
	var n_signature: ASignature is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
	var n_extern_calls: nullable AExternCalls = null is writable
	var n_extern_code_block: nullable AExternCodeBlock = null is writable
	var n_block: nullable AExpr = null is writable
end
class ASuperPropdef
	super APropdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: AVisibility is writable, noinit
	var n_kwsuper: TKwsuper is writable, noinit
	var n_type: AType is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AAnnotPropdef
	super APropdef
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: nullable AVisibility = null is writable
	var n_atid: AAtid is writable, noinit
	var n_opar: nullable TOpar = null is writable
	var n_args: List[AExpr] = new List[AExpr]
	var n_cpar: nullable TCpar = null is writable
	var n_annotations: nullable AAnnotations = null is writable
end
class AIdMethid
	super AMethid
	var n_id: TId is writable, noinit
end
class APlusMethid
	super AMethid
	var n_op: TPlus is writable, noinit
end
class AMinusMethid
	super AMethid
	var n_op: TMinus is writable, noinit
end
class AStarMethid
	super AMethid
	var n_op: TStar is writable, noinit
end
class AStarstarMethid
	super AMethid
	var n_op: TStarstar is writable, noinit
end
class ASlashMethid
	super AMethid
	var n_op: TSlash is writable, noinit
end
class APercentMethid
	super AMethid
	var n_op: TPercent is writable, noinit
end
class AEqMethid
	super AMethid
	var n_op: TEq is writable, noinit
end
class ANeMethid
	super AMethid
	var n_op: TNe is writable, noinit
end
class ALeMethid
	super AMethid
	var n_op: TLe is writable, noinit
end
class AGeMethid
	super AMethid
	var n_op: TGe is writable, noinit
end
class ALtMethid
	super AMethid
	var n_op: TLt is writable, noinit
end
class AGtMethid
	super AMethid
	var n_op: TGt is writable, noinit
end
class ALlMethid
	super AMethid
	var n_op: TLl is writable, noinit
end
class AGgMethid
	super AMethid
	var n_op: TGg is writable, noinit
end
class AStarshipMethid
	super AMethid
	var n_op: TStarship is writable, noinit
end
class APipeMethid
	super AMethid
	var n_op: TPipe is writable, noinit
end
class ACaretMethid
	super AMethid
	var n_op: TCaret is writable, noinit
end
class AAmpMethid
	super AMethid
	var n_op: TAmp is writable, noinit
end
class ATildeMethid
	super AMethid
	var n_op: TTilde is writable, noinit
end
class ABraMethid
	super AMethid
	var n_obra: TObra is writable, noinit
	var n_cbra: TCbra is writable, noinit
end
class AAssignMethid
	super AMethid
	var n_id: TId is writable, noinit
	var n_assign: TAssign is writable, noinit
end
class ABraassignMethid
	super AMethid
	var n_obra: TObra is writable, noinit
	var n_cbra: TCbra is writable, noinit
	var n_assign: TAssign is writable, noinit
end
class ASignature
	super ASignature
	var n_opar: nullable TOpar = null is writable
	var n_params: List[AParam] = new List[AParam]
	var n_cpar: nullable TCpar = null is writable
	var n_type: nullable AType = null is writable
end
class AParam
	super AParam
	var n_id: TId is writable, noinit
	var n_type: nullable AType = null is writable
	var n_dotdotdot: nullable TDotdotdot = null is writable
	var n_annotations: nullable AAnnotations = null is writable
end
class AType
	super AType
	var n_kwnullable: nullable TKwnullable = null is writable
	var n_id: TClassid is writable, noinit
	var n_types: List[AType] = new List[AType]
	var n_annotations: nullable AAnnotations = null is writable
end
class ALabel
	super ALabel
	var n_kwlabel: TKwlabel is writable, noinit
	var n_id: nullable TId = null is writable
end
class ABlockExpr
	super AExpr
	var n_expr: List[AExpr] = new List[AExpr]
	var n_kwend: nullable TKwend = null is writable
end
class AVardeclExpr
	super AExpr
	var n_kwvar: nullable TKwvar = null is writable
	var n_id: TId is writable, noinit
	var n_type: nullable AType = null is writable
	var n_assign: nullable TAssign = null is writable
	var n_expr: nullable AExpr = null is writable
	var n_annotations: nullable AAnnotations = null is writable
end
class AReturnExpr
	super AExpr
	var n_kwreturn: nullable TKwreturn = null is writable
	var n_expr: nullable AExpr = null is writable
end
class ABreakExpr
	super AExpr
	var n_kwbreak: TKwbreak is writable, noinit
	var n_label: nullable ALabel = null is writable
end
class AAbortExpr
	super AExpr
	var n_kwabort: TKwabort is writable, noinit
end
class AContinueExpr
	super AExpr
	var n_kwcontinue: nullable TKwcontinue = null is writable
	var n_label: nullable ALabel = null is writable
end
class ADoExpr
	super AExpr
	var n_kwdo: TKwdo is writable, noinit
	var n_block: nullable AExpr = null is writable
	var n_label: nullable ALabel = null is writable
end
class AIfExpr
	super AExpr
	var n_kwif: TKwif is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_then: nullable AExpr = null is writable
	var n_else: nullable AExpr = null is writable
end
class AIfexprExpr
	super AExpr
	var n_kwif: TKwif is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_kwthen: TKwthen is writable, noinit
	var n_then: AExpr is writable, noinit
	var n_kwelse: TKwelse is writable, noinit
	var n_else: AExpr is writable, noinit
end
class AWhileExpr
	super AExpr
	var n_kwwhile: TKwwhile is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_kwdo: TKwdo is writable, noinit
	var n_block: nullable AExpr = null is writable
	var n_label: nullable ALabel = null is writable
end
class ALoopExpr
	super AExpr
	var n_kwloop: TKwloop is writable, noinit
	var n_block: nullable AExpr = null is writable
	var n_label: nullable ALabel = null is writable
end
class AForExpr
	super AExpr
	var n_kwfor: TKwfor is writable, noinit
	var n_ids: List[TId] = new List[TId]
	var n_expr: AExpr is writable, noinit
	var n_kwdo: TKwdo is writable, noinit
	var n_block: nullable AExpr = null is writable
	var n_label: nullable ALabel = null is writable
end
class AWithExpr
	super AExpr
	var n_kwwith: TKwwith is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_kwdo: TKwdo is writable, noinit
	var n_block: nullable AExpr = null is writable
	var n_label: nullable ALabel = null is writable
end
class AAssertExpr
	super AExpr
	var n_kwassert: TKwassert is writable, noinit
	var n_id: nullable TId = null is writable
	var n_expr: AExpr is writable, noinit
	var n_else: nullable AExpr = null is writable
end
class AOnceExpr
	super AExpr
	var n_kwonce: TKwonce is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class ASendExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
end
class ABinopExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AOrExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TKwor is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AAndExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TKwand is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AOrElseExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TKwor is writable, noinit
	var n_kwelse: TKwelse is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AImpliesExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TKwimplies is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ANotExpr
	super AExpr
	var n_kwnot: TKwnot is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class AEqExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TEq is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ANeExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TNe is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ALtExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TLt is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ALeExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TLe is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ALlExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TLl is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AGtExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TGt is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AGeExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TGe is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AGgExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TGg is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AIsaExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_kwisa: TKwisa is writable, noinit
	var n_type: AType is writable, noinit
end
class APlusExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TPlus is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AMinusExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TMinus is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AStarshipExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TStarship is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AStarExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TStar is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AStarstarExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TStarstar is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ASlashExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TSlash is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class APercentExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TPercent is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class APipeExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TPipe is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class ACaretExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TCaret is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AAmpExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_op: TAmp is writable, noinit
	var n_expr2: AExpr is writable, noinit
end
class AUminusExpr
	super AExpr
	var n_op: TMinus is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class AUplusExpr
	super AExpr
	var n_op: TPlus is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class AUtildeExpr
	super AExpr
	var n_op: TTilde is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class ANewExpr
	super AExpr
	var n_kwnew: TKwnew is writable, noinit
	var n_type: AType is writable, noinit
	var n_id: nullable TId = null is writable
	var n_args: AExprs is writable, noinit
end
class AAttrExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TAttrid is writable, noinit
end
class AAttrAssignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TAttrid is writable, noinit
	var n_assign: TAssign is writable, noinit
	var n_value: AExpr is writable, noinit
end
class AAttrReassignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TAttrid is writable, noinit
	var n_assign_op: AAssignOp is writable, noinit
	var n_value: AExpr is writable, noinit
end
class ACallExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TId is writable, noinit
	var n_args: AExprs is writable, noinit
end
class ACallAssignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TId is writable, noinit
	var n_args: AExprs is writable, noinit
	var n_assign: TAssign is writable, noinit
	var n_value: AExpr is writable, noinit
end
class ACallReassignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: TId is writable, noinit
	var n_args: AExprs is writable, noinit
	var n_assign_op: AAssignOp is writable, noinit
	var n_value: AExpr is writable, noinit
end
class ASuperExpr
	super AExpr
	var n_qualified: nullable AQualified = null is writable
	var n_kwsuper: TKwsuper is writable, noinit
	var n_args: AExprs is writable, noinit
end
class AInitExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_kwinit: TKwinit is writable, noinit
	var n_args: AExprs is writable, noinit
end
class ABraExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_args: AExprs is writable, noinit
end
class ABraAssignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_args: AExprs is writable, noinit
	var n_assign: TAssign is writable, noinit
	var n_value: AExpr is writable, noinit
end
class ABraReassignExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_args: AExprs is writable, noinit
	var n_assign_op: AAssignOp is writable, noinit
	var n_value: AExpr is writable, noinit
end
class AVarExpr
	super AExpr
	var n_id: TId is writable, noinit
end
class AVarAssignExpr
	super AExpr
	var n_id: TId is writable, noinit
	var n_assign: TAssign is writable, noinit
	var n_value: AExpr is writable, noinit
end
class AVarReassignExpr
	super AExpr
	var n_id: TId is writable, noinit
	var n_assign_op: AAssignOp is writable, noinit
	var n_value: AExpr is writable, noinit
end
class ARangeExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_expr2: AExpr is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ACrangeExpr
	super AExpr
	var n_obra: TObra is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_expr2: AExpr is writable, noinit
	var n_cbra: TCbra is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AOrangeExpr
	super AExpr
	var n_obra: TObra is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_expr2: AExpr is writable, noinit
	var n_cbra: TObra is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AArrayExpr
	super AExpr
	var n_obra: TObra is writable, noinit
	var n_exprs: List[AExpr] = new List[AExpr]
	var n_type: nullable AType = null is writable
	var n_cbra: TCbra is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ASelfExpr
	super AExpr
	var n_kwself: TKwself is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AImplicitSelfExpr
	super AExpr
end
class ATrueExpr
	super AExpr
	var n_kwtrue: TKwtrue is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AFalseExpr
	super AExpr
	var n_kwfalse: TKwfalse is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ANullExpr
	super AExpr
	var n_kwnull: TKwnull is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ADecIntExpr
	super AExpr
	var n_number: TNumber is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AHexIntExpr
	super AExpr
	var n_hex_number: THexNumber is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AFloatExpr
	super AExpr
	var n_float: TFloat is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class ACharExpr
	super AExpr
	var n_char: TChar is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AStringExpr
	super AExpr
	var n_string: TString is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AStartStringExpr
	super AExpr
	var n_string: TStartString is writable, noinit
end
class AMidStringExpr
	super AExpr
	var n_string: TMidString is writable, noinit
end
class AEndStringExpr
	super AExpr
	var n_string: TEndString is writable, noinit
end
class ASuperstringExpr
	super AExpr
	var n_exprs: List[AExpr] = new List[AExpr]
	var n_annotations: nullable AAnnotations = null is writable
end
class AParExpr
	super AExpr
	var n_opar: TOpar is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_cpar: TCpar is writable, noinit
	var n_annotations: nullable AAnnotations = null is writable
end
class AAsCastExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_kwas: TKwas is writable, noinit
	var n_opar: nullable TOpar = null is writable
	var n_type: AType is writable, noinit
	var n_cpar: nullable TCpar = null is writable
end
class AAsNotnullExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_kwas: TKwas is writable, noinit
	var n_opar: nullable TOpar = null is writable
	var n_kwnot: TKwnot is writable, noinit
	var n_kwnull: TKwnull is writable, noinit
	var n_cpar: nullable TCpar = null is writable
end
class AIssetAttrExpr
	super AExpr
	var n_kwisset: TKwisset is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_id: TAttrid is writable, noinit
end
class ADebugTypeExpr
	super AExpr
	var n_kwdebug: TKwdebug is writable, noinit
	var n_kwtype: TKwtype is writable, noinit
	var n_expr: AExpr is writable, noinit
	var n_type: AType is writable, noinit
end
class AVarargExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_dotdotdot: TDotdotdot is writable, noinit
end
class ANamedargExpr
	super AExpr
	var n_id: TId is writable, noinit
	var n_assign: TAssign is writable, noinit
	var n_expr: AExpr is writable, noinit
end
class ATypeExpr
	super AExpr
	var n_type: AType is writable, noinit
end
class AMethidExpr
	super AExpr
	var n_expr: AExpr is writable, noinit
	var n_id: AMethid is writable, noinit
end
class AAtExpr
	super AExpr
	var n_annotations: AAnnotations is writable, noinit
end
class AManyExpr
	super AExpr
	var n_exprs: List[AExpr] = new List[AExpr]
end
class AListExprs
	super AExprs
	var n_exprs: List[AExpr] = new List[AExpr]
end
class AParExprs
	super AExprs
	var n_opar: TOpar is writable, noinit
	var n_exprs: List[AExpr] = new List[AExpr]
	var n_cpar: TCpar is writable, noinit
end
class ABraExprs
	super AExprs
	var n_obra: TObra is writable, noinit
	var n_exprs: List[AExpr] = new List[AExpr]
	var n_cbra: TCbra is writable, noinit
end
class APlusAssignOp
	super AAssignOp
	var n_op: TPluseq is writable, noinit
end
class AMinusAssignOp
	super AAssignOp
	var n_op: TMinuseq is writable, noinit
end
class AStarAssignOp
	super AAssignOp
	var n_op: TStareq is writable, noinit
end
class ASlashAssignOp
	super AAssignOp
	var n_op: TSlasheq is writable, noinit
end
class APercentAssignOp
	super AAssignOp
	var n_op: TPercenteq is writable, noinit
end
class AStarstarAssignOp
	super AAssignOp
	var n_op: TStarstareq is writable, noinit
end
class APipeAssignOp
	super AAssignOp
	var n_op: TPipeeq is writable, noinit
end
class ACaretAssignOp
	super AAssignOp
	var n_op: TCareteq is writable, noinit
end
class AAmpAssignOp
	super AAssignOp
	var n_op: TAmpeq is writable, noinit
end
class ALlAssignOp
	super AAssignOp
	var n_op: TLleq is writable, noinit
end
class AGgAssignOp
	super AAssignOp
	var n_op: TGgeq is writable, noinit
end
class AModuleName
	super AModuleName
	var n_quad: nullable TQuad = null is writable
	var n_path: List[TId] = new List[TId]
	var n_id: TId is writable, noinit
end
class AExternCalls
	super AExternCalls
	var n_kwimport: TKwimport is writable, noinit
	var n_extern_calls: List[AExternCall] = new List[AExternCall]
end
class AExternCall
	super AExternCall
end
class ASuperExternCall
	super AExternCall
	var n_kwsuper: TKwsuper is writable, noinit
end
class ALocalPropExternCall
	super AExternCall
	var n_methid: AMethid is writable, noinit
end
class AFullPropExternCall
	super AExternCall
	var n_type: AType is writable, noinit
	var n_dot: nullable TDot = null is writable
	var n_methid: AMethid is writable, noinit
end
class AInitPropExternCall
	super AExternCall
	var n_type: AType is writable, noinit
end
class ACastAsExternCall
	super AExternCall
	var n_from_type: AType is writable, noinit
	var n_dot: nullable TDot = null is writable
	var n_kwas: TKwas is writable, noinit
	var n_to_type: AType is writable, noinit
end
class AAsNullableExternCall
	super AExternCall
	var n_type: AType is writable, noinit
	var n_kwas: TKwas is writable, noinit
	var n_kwnullable: TKwnullable is writable, noinit
end
class AAsNotNullableExternCall
	super AExternCall
	var n_type: AType is writable, noinit
	var n_kwas: TKwas is writable, noinit
	var n_kwnot: TKwnot is writable, noinit
	var n_kwnullable: TKwnullable is writable, noinit
end
class AInLanguage
	super AInLanguage
	var n_kwin: TKwin is writable, noinit
	var n_string: TString is writable, noinit
end
class AExternCodeBlock
	super AExternCodeBlock
	var n_in_language: nullable AInLanguage = null is writable
	var n_extern_code_segment: TExternCodeSegment is writable, noinit
end
class AQualified
	super AQualified
	var n_id: List[TId] = new List[TId]
	var n_classid: nullable TClassid = null is writable
end
class ADoc
	super ADoc
	var n_comment: List[TComment] = new List[TComment]
end
class AAnnotations
	super AAnnotations
	var n_at: nullable TAt = null is writable
	var n_opar: nullable TOpar = null is writable
	var n_items: List[AAnnotation] = new List[AAnnotation]
	var n_cpar: nullable TCpar = null is writable
end
class AAnnotation
	super AAnnotation
	var n_doc: nullable ADoc = null is writable
	var n_kwredef: nullable TKwredef = null is writable
	var n_visibility: nullable AVisibility = null is writable
	var n_atid: AAtid is writable, noinit
	var n_opar: nullable TOpar = null is writable
	var n_args: List[AExpr] = new List[AExpr]
	var n_cpar: nullable TCpar = null is writable
	var n_annotations: nullable AAnnotations = null is writable
end
class AIdAtid
	super AAtid
	var n_id: TId is writable, noinit
end
class AKwexternAtid
	super AAtid
	var n_id: TKwextern is writable, noinit
end
class AKwabstractAtid
	super AAtid
	var n_id: TKwabstract is writable, noinit
end
class AKwimportAtid
	super AAtid
	var n_id: TKwimport is writable, noinit
end

class Start
	super Prod
	var n_base: nullable AModule is writable, noinit
	var n_eof: EOF is writable, noinit
	init(
		n_base: nullable AModule,
		n_eof: EOF)
	do
		_n_base = n_base
		_n_eof = n_eof
	end
end
