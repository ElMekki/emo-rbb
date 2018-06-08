
$ps="p3"
$color="Magenta"
$listPS=@("p1","p2")
$logPATH="D:\temp"

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-host("START :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color *>&1|out-file "$logPATH\p.log"
Write-host("START :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color
#
$listPS|ForEach-Object {
    #Write-Output $(Join-Path $scriptPath -ChildPath $_)
    invoke-command -ScriptBlock {& $(Join-Path $scriptPath -ChildPath "$_.ps1") *>&1|out-file "$logPATH\p.log" -Append}
    #&  $(Join-Path $scriptPath -ChildPath "$_.ps1")
}
Write-host("END :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color