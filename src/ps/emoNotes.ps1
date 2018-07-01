(Get-EventSubscriber).SubscriptionId
#
(Get-EventSubscriber).SubscriptionId|ForEach-Object{Unregister-Event -SubscriptionId $_}

####
Start-Job -PSPath .\tesWatcher.ps1
