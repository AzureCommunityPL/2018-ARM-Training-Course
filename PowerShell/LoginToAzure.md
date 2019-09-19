# Authenticate to Azure

    Login-AzAccount

# Select an Azure Subscription for which to report usage data

    $subscriptionId = (Get-AzSubscription | Out-GridView -Title "Select an Azure Subscription ..." -PassThru).SubscriptionId

# Select Azure subscription context

    Select-AzSubscription -Subscription $subscriptionId