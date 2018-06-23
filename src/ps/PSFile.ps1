param($env)

$listCode=@("100","200","300","400","500")
$fileLog=Join-Path $PSScriptRoot -ChildPath "logs\file.log"

#$FormattedDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss" 

#
function getDate {
    $myDate = "{0:yyyy/MM/dd hh:mm:ss}" -f (get-date)
    retrun $myDate
}

#
Clear-Host

write-host("file logs : {0}" -f $fileLog)

#exit 0
function Get-TimeStamp {
    
    return "[{0:yyyy/MM/dd} {0:HH:mm:ss}]" -f (Get-Date)
    
}

write-output("$(Get-TimeStamp) START TRT sur le domaine : {0}" -f $env)

if (! (Test-Path $fileLog)) {
    new-item $fileLog -Force -ItemType File 
} else {
    Write-Warning "Log file $fileLog already exists."
}

write-output("$(Get-TimeStamp)- START TRT sur le domaine : {0}"-f $env)|out-file -FilePath $fileLog -Force

#exit 0

$listCode| ForEach-Object {
    Write-Output("$(Get-TimeStamp)- Code retour {0}" -f $_) | out-file -FilePath $fileLog -Append
}

Start-Sleep 2
write-output("$(Get-TimeStamp) - END TRT sur le domaine : {0}"-f $env)|out-file -FilePath $fileLog -Append