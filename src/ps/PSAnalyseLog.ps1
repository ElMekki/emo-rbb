#
$listCode=@("403","505","401")
$fileLog=Join-Path $PSScriptRoot -ChildPath "logs\file.log"

if(!(Test-Path $fileLog)){
    write-error("File Log $fileLog not exist.")

} else {
    $nbre= (Get-Content $fileLog |Select-String $listCode).count

    if ($nbre -gt 0) {
        return 1
    }else {
        return 0
    }
}