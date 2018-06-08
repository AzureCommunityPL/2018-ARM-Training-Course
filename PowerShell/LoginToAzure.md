# Authenticate to Azure

    Login-AzureRmAccount

# Select an Azure Subscription for which to report usage data

    $subscriptionId = 
        (Get-AzureRmSubscription |
         Out-GridView `
            -Title "Select an Azure Subscription ..." `
            -PassThru).SubscriptionId

# Select Azure subscription context

    Select-AzureRmSubscription -SubscriptionId $subscriptionId