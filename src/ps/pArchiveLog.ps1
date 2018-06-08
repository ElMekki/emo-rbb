# include p0main.ps1
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
. $(Join-Path $scriptPath -ChildPath "p0main.ps1")

#$logPATH=$logPATH
$dateJour=(Get-Date).toString("yyyy-MM-dd")

#
$dest="$logPATH\$($dateJour)_P_log.zip"
function archive {

    $logFiles=Get-ChildItem -Path $logPATH -Filter *.log|where-object {$_.CreationTime -lt (get-date).AddDays(-0)} 
    if($logFiles) {
        $logFiles|ForEach-Object {
            Write-write ("File logs: {0}" -f $_.FullName)
            Compress-Archive $_.FullName -DestinationPath $dest -Update
            Remove-Item $_.FullName
        }
    } else {
        write-host ("Aucun fichier logs n a ete tourve!")
    }


}

#
Write-host("Path Logs {0} : " -f $logPATH)
# Clear the screen
Clear-Host

# Get source path
#$logFiles = get-childitem -Path $source -Filter *.log | where-object {$_.CreationTime -lt (get-date).AddDays(-0)} 
archive
