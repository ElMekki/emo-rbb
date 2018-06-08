
$wrkDIR=split-path -parent $MyInvocation.MyCommand.Definition
$dest="d:\temp\jenkins\workspace"
Set-Location $dest
write-host("username : {0}`n"-f $ENV:USERNAME)
if (Test-Path ".\scripts") {
    Remove-Item -r .\scripts -fo
} else {
    mkdir scripts |Out-Null
}

git clone https://github.com/ElMekki/emo-rbb.git scripts
powershell "$dest\scripts\src\ps\pArchiveLog.ps1"
cd $wrkDIR