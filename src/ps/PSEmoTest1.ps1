param(
    [String]$action
    )

$Object=" [{0}] - File {1} was {2}" -f (Get-Date).ToString('yyyy-MM-dd HH:mm:ss'),
"file1.txt",
$action

$Color=''
switch ($action) {
    'Created' { $Color = 'Green' }
    'Deleted' { $Color = 'Red' }
    Default { $Color = 'Yellow' }
}

$WriteHostParams  = @{
    ForegroundColor = $Color
    BackgroundColor = 'Black'
    Object =  $Object
}

Clear-Host
Write-Host @WriteHostParams

$SelectParams=@{
    First=10
    property=@('id','cpu','Name','Path')

}

Get-Process|Select-Object @SelectParams