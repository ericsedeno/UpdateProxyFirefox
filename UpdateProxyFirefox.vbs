Const SOBREESCRIBIR = True
Const ForAppending = 8
Dim objNet
Dim New_folder
Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
strPath=objShell.ExpandEnvironmentStrings("%AppData%")
Set objFileSystem = CreateObject("Scripting.FileSystemObject") 
Set objNet = CreateObject("WScript.NetWork") 

'COMPRUEBO SI LA CARPETA DEL PERFIL DE FIREFOX EXISTE EN EL USUARIO ACTUAL
if objFilesystem.FileExists (strPath&"\Mozilla\Firefox\profiles.ini") = True then
	strPath=strPath&"\Mozilla\Firefox\Profiles\"
	Set objFolder = objFSO.GetFolder(strPath)
	Set subFolder = objFolder.SubFolders

	For Each folder in subFolder      
		objFSO.CopyFile "\\tu.dominio.cu\scripts\UpdateProxyFirefox\cert_override.txt", folder&"\", SOBREESCRIBIR 
		objFSO.CopyFile "\\tu.dominio.cu\scripts\UpdateProxyFirefox\prefs.js", folder&"\", SOBREESCRIBIR 
	next
end if
