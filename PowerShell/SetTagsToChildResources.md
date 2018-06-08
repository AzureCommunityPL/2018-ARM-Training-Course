# Get resource group

    $rg = Get-AzureRmResourceGroup -Name "name of resource gorup"
    $rg.Tags
    $rgname = $rg.ResourceGroupName

# Get resources within resource group
    $resources = Get-AzureRmResource -ResourceGroupName $rgname

# Set resource tags for each resource inside resource group
    
    foreach ($resource in $resources)
    {
        if ($resource.Tags -like $null)
        {
            Set-AzureRmResource -ResourceId $resource.ResourceId -Tag $rg.Tags -Force
        }
    }
