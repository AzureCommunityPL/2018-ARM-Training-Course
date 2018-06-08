# Create new SPN

    az ad sp create-for-rbac -n "AppName" --role contributor  --scopes /subscriptions/<SubscriptionID>