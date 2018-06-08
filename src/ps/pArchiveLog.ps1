# include p0main.ps1
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
. $(Join-Path $scriptPath -ChildPath "p0main.ps1")

#$logPATH=$logPATH
$dateJour=(Get-Date).toString("yyyy-MM-dd")

#
$dest="$logPATH\$($dateJour)_P_log1.zip"
function archive {
    $logFiles=Get-ChildItem -Path $logPATH -Filter *.log|where-object {$_.CreationTime -lt (get-date).AddDays(-0)} 
    
    $logFiles|ForEach-Object {
        Write-Output $_.FullName
        Compress-Archive $_.FullName -DestinationPath $dest -Update
        Remove-Item $_.FullName
    }

}

#
Write-host("Path Logs {0} : " -f $logPATH)
# Clear the screen
Clear-Host

# Get source path
#$logFiles = get-childitem -Path $source -Filter *.log | where-object {$_.CreationTime -lt (get-date).AddDays(-0)} 
archive
