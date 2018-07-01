(Get-EventSubscriber).SubscriptionId
#
(Get-EventSubscriber).SubscriptionId|%{Unregister-Event -SubscriptionId $_}

####
Start-Job -PSPath .\tesWatcher.ps1
