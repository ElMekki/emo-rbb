$FileSystemWatcher = New-Object System.IO.FileSystemWatcher
$folder="D:\labs\sncf\Ariane-instance-Tomcat"
$FileSystemWatcher.Path  = $folder
$FileSystemWatcher.IncludeSubdirectories=$true
$FileSystemWatcher.EnableRaisingEvents=$true


#
function setEvent {
    param (
        [String]$action,
        [Object]$pso
    )

    $watcher= {
        $Object  = "{0} was  {1} at {2} :: {3}" -f $Event.SourceEventArgs.FullPath,
        $Event.SourceEventArgs.ChangeType,
        $Event.TimeGenerated,
        $Event.MessageData.folder

        $WriteHostParams  = @{
            ForegroundColor = 'Green'
            BackgroundColor =  'Black'
            Object =  $Object
        }
    
        Write-Host @WriteHostParams
    
        #
        Robocopy $Event.MessageData.folder C:\tmp /MIR /XA:H /W:0 /R:1 /REG /LOG:D:\labs\robocopy\logRobo.log
    }

    Register-ObjectEvent -InputObject $FileSystemWatcher  -EventName $action -Action $watcher -MessageData $pso
}
#
$pso = new-object psobject -property @{folder=$folder}

setEvent -a Created -p $pso
setEvent -a Deleted -p $pso