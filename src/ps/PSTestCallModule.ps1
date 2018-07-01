
#. .\PSTestFunction.ps1

Import-Module .\PSTestModule.psm1

Write-Output("{0} - STARTING TRT ON {1} ..."-f $(GetTimestamp), $srvHOST)
Start-Sleep 2
Write-Output "$(GetTimestamp) - END TRT ..."




