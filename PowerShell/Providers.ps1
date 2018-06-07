#region Get Providers
Get-AzureRmResourceProvider -ListAvailable | Select-Object ProviderNamespace, RegistrationState 
#endregion

#region Get Providers Count
Get-AzureRmResourceProvider -ListAvailable | Select-Object ProviderNamespace | measure
#endregion

#region Resource Types
(Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes.ResourceTypeName
#endregion

#region API
((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).ApiVersions
#endregion

#region Locations
((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | Where-Object ResourceTypeName -eq virtualMachines).locations
#endregion

#region Operations
Get-AzureRmProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/"
Get-AzureRmProviderOperation | where Operation -match "Microsoft.Compute/virtualMachines/" | select Operation
#endregion