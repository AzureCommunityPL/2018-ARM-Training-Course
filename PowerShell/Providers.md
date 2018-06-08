# Get Providers
    
    Get-AzureRmResourceProvider -ListAvailable | Select-Object ProviderNamespace, RegistrationState 


# Get Providers Count

    Get-AzureRmResourceProvider -ListAvailable | Select-Object ProviderNamespace | measure

# Resource Types

    (Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes.ResourceTypeName

# API

    ((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).ApiVersions

# Locations

    ((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).locations

# Operations

    Get-AzureRmProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/"
    Get-AzureRmProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/" | select Operation
