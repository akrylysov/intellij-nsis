package com.krylysov.nsisplugin;
import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import com.krylysov.nsisplugin.psi.NsisTypes;
import com.intellij.psi.TokenType;

%%

%class NsisLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%ignorecase
%eof{  return;
%eof}

LineTerminator          = \r|\n|\r\n
InputCharacter          = [^\r\n]
WhiteSpace              = [ \t]
Comment                 = [;#] {InputCharacter}*
CompilerCommand         = (\!include|\!addincludedir|\!addplugindir|\!appendfile|\!cd|\!delfile|\!echo|\!error|\!execute|\!packhdr|\!finalize|\!getdllversion|\!system|\!tempfile|\!warning|\!verbose|\!define|\!undef|\!insertmacro|\!makensis|\!searchparse|\!searchreplace)
Instruction = (Abort|AddBrandingImage|AddSize|AllowRootDirInstall|AllowSkipFiles|AutoCloseWindow|BGFont|BGGradient|BrandingText|BringToFront|Call|CallInstDLL|Caption|ChangeUI|CheckBitmap|ClearErrors|CompletedText|ComponentText|CopyFiles|CRCCheck|CreateDirectory|CreateFont|CreateShortCut|Delete|DeleteINISec|DeleteINIStr|DeleteRegKey|DeleteRegValue|DetailPrint|DetailsButtonText|DirText|DirVar|DirVerify|EnableWindow|EnumRegKey|EnumRegValue|Exch|Exec|ExecShell|ExecWait|ExpandEnvStrings|File|FileBufSize|FileClose|FileErrorText|FileOpen|FileRead|FileReadByte|FileReadUTF16LE|FileReadWord|FileWriteUTF16LE|FileSeek|FileWrite|FileWriteByte|FileWriteWord|FindClose|FindFirst|FindNext|FindWindow|FlushINI|GetCurInstType|GetCurrentAddress|GetDlgItem|GetDLLVersion|GetDLLVersionLocal|GetErrorLevel|GetFileTime|GetFileTimeLocal|GetFullPathName|GetFunctionAddress|GetInstDirError|GetLabelAddress|GetTempFileName|Goto|HideWindow|Icon|IfAbort|IfErrors|IfFileExists|IfRebootFlag|IfSilent|InitPluginsDir|InstallButtonText|InstallColors|InstallDir|InstallDirRegKey|InstProgressFlags|InstType|InstTypeGetText|InstTypeSetText|IntCmp|IntCmpU|IntFmt|IntOp|IsWindow|LangString|LicenseBkColor|LicenseData|LicenseForceSelection|LicenseLangString|LicenseText|LoadLanguageFile|LockWindow|LogSet|LogText|ManifestDPIAware|ManifestSupportedOS|MessageBox|MiscButtonText|Name|Nop|OutFile|Page|PageCallbacks|Pop|Push|Quit|ReadEnvStr|ReadINIStr|ReadRegDWORD|ReadRegStr|Reboot|RegDLL|Rename|RequestExecutionLevel|ReserveFile|Return|RMDir|SearchPath|SectionGetFlags|SectionGetInstTypes|SectionGetSize|SectionGetText|SectionIn|SectionSetFlags|SectionSetInstTypes|SectionSetSize|SectionSetText|SendMessage|SetAutoClose|SetBrandingImage|SetCompress|SetCompressor|SetCompressorDictSize|SetCtlColors|SetCurInstType|SetDatablockOptimize|SetDateSave|SetDetailsPrint|SetDetailsView|SetErrorLevel|SetErrors|SetFileAttributes|SetFont|SetOutPath|SetOverwrite|SetPluginUnload|SetRebootFlag|SetRegView|SetShellVarContext|SetSilent|ShowInstDetails|ShowUninstDetails|ShowWindow|SilentInstall|SilentUnInstall|Sleep|SpaceTexts|StrCmp|StrCmpS|StrCpy|StrLen|SubCaption|Unicode|UninstallButtonText|UninstallCaption|UninstallIcon|UninstallSubCaption|UninstallText|UninstPage|UnRegDLL|Var|VIAddVersionKey|VIFileVersion|VIProductVersion|WindowIcon|WriteINIStr|WriteRegBin|WriteRegDWORD|WriteRegExpandStr|WriteRegStr|WriteUninstaller|XPStyle)
BlockDeclaration = (Function|FunctionEnd|Section|SectionEnd|SectionGroup|SectionGroupEnd|SubSection|SubSectionEnd|PageEx|PageExEnd|\!macro|\!macroend)
ControlCommand = (\!ifdef|\!ifndef|\!if|\!ifmacrodef|\!ifmacrondef|\!else|\!endif)
Constant = (HKCC|HKCR|HKCU|HKDD|HKLM|HKPD|HKU|MB_ABORTRETRYIGNORE|MB_DEFBUTTON1|MB_DEFBUTTON2|MB_DEFBUTTON3|MB_DEFBUTTON4|MB_ICONEXCLAMATION|MB_ICONINFORMATION|MB_ICONQUESTION|MB_ICONSTOP|MB_OK|MB_OKCANCEL|MB_RETRYCANCEL|MB_RIGHT|MB_RTLREADING|MB_SETFOREGROUND|MB_TOPMOST|MB_USERICON|MB_YESNO|MB_YESNOCANCEL|IDABORT|IDCANCEL|IDIGNORE|IDNO|IDOK|IDRETRY|IDYES|SHCTX)
PluginCall              = {Identifier} "::" {Identifier}
Label                   = {Identifier} ":"
Number                  = [:jletterdigit:]+
SpecialSymbol           = "*"|"-"|"+"|"!="|"<>"|"=="|"<="|">="|"<"|">"|"/"|"="|"("|")"|"&"|","
StringSq                = \'([^\\\'\r\n]|\\[^\r\n])*(\')
StringDq                = \"([^\\\"\r\n]|\\[^\r\n])*(\")
StringBq                = \`([^\\\`\r\n]|\\[^\r\n])*(\`)
String                  = {StringSq}|{StringDq}|{StringBq}
Identifier              = [:jletter:][:jletterdigit:]*
UninstallerIdentifier   = [i:un\.] {Identifier}
Value                   = "${" ({Identifier}|{PluginCall}) "}"
Variable                = "$" ({Identifier}|{PluginCall}|{Number})

%state String

%%

{LineTerminator}        { return NsisTypes.NEWLINE;}
{WhiteSpace}+           { return TokenType.WHITE_SPACE; }
{Comment}               { return NsisTypes.COMMENT; }
{CompilerCommand}       { return NsisTypes.COMPILER_COMMAND; }
{ControlCommand}        { return NsisTypes.KEYWORD; }
{BlockDeclaration}      { return NsisTypes.BLOCK_DECLARATION; }
{Instruction}           { return NsisTypes.INSTRUCTION; }
{PluginCall}            { return NsisTypes.PLUGIN_CALL; }
{String}                { return NsisTypes.STRING; }
{Value}                 { return NsisTypes.VALUE; }
{SpecialSymbol}         { return NsisTypes.SPECIAL_SYMBOL; }
{Constant}              { return NsisTypes.CONSTANT; }
{Variable}              { return NsisTypes.VARIABLE; }
{Identifier}|{UninstallerIdentifier}|{Label}     { return NsisTypes.IDENTIFIER; }
{Number}                { return NsisTypes.NUMBER; }
.                       { return NsisTypes.IDENTIFIER; }