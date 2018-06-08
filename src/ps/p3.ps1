
# include p0main.ps1
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
. $(Join-Path $scriptPath -ChildPath "p0main.ps1")

#
$ps="p3"
$color="Magenta"
$listPS=@("p1","p2")


#
$p0=$(Join-Path $scriptPath -ChildPath "p0main.ps1")
Write-Output('p0: {0}, logpath: {1}' -f $p0, $logPATH)

#
Write-host("START :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color *>&1|out-file "$logPATH\p.log"
Write-host("START :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color
#
$listPS|ForEach-Object {
    #Write-Output $(Join-Path $scriptPath -ChildPath $_)
    invoke-command -ScriptBlock {& $(Join-Path $scriptPath -ChildPath "$_.ps1") *>&1|out-file "$logPATH\p.log" -Append}
    #&  $(Join-Path $scriptPath -ChildPath "$_.ps1")
}
Write-host("END :  Script {0}, ON {1} ..." -f $ps,$scriptPath) -ForegroundColor $color