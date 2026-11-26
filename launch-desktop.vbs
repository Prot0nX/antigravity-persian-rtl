Option Explicit
Dim fso, sh, scriptDir, pyCmd, argsStr, i, rc, fallbackExe
Set fso = CreateObject("Scripting.FileSystemObject")
Set sh  = CreateObject("WScript.Shell")

scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
argsStr = ""
For i = 0 To WScript.Arguments.Count - 1
    argsStr = argsStr & " """ & Replace(WScript.Arguments(i), """", "\""") & """"
Next

pyCmd = "python """ & scriptDir & "\antigravity_rtl.py"" launch desktop --" & argsStr
On Error Resume Next
rc = sh.Run(pyCmd, 0, True)
If Err.Number <> 0 Or rc <> 0 Then
    Err.Clear
    fallbackExe = sh.ExpandEnvironmentStrings("%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe")
    If fso.FileExists(fallbackExe) Then
        sh.Run """" & fallbackExe & """" & argsStr, 1, False
    End If
End If
