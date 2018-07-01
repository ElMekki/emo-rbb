$listIDEvent=(Get-EventSubscriber).SubscriptionId

if($listIDEvent) {
    Write-Host ("Purge Event [{0}] en cours ..." -f $listIDEvent.length)
    $listIDEvent|ForEach-Object{
        Unregister-Event -SubscriptionId $_
    }
} else {
    Write-Host "Aucun Event"
}