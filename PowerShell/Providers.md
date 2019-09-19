# Get Providers
    
    Get-AzResourceProvider -ListAvailable | Select-Object ProviderNamespace, RegistrationState 


# Get Providers Count

    Get-AzResourceProvider -ListAvailable | Select-Object ProviderNamespace | measure

# Resource Types

    (Get-AzResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes.ResourceTypeName

# API

    ((Get-AzResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).ApiVersions

# Locations

    ((Get-AzResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).locations

# Operations

    Get-AzProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/"
    Get-AzProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/" | select Operation
