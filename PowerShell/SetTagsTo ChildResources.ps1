$rg = Get-AzureRmResourceGroup -Name "name of resource gorup"
$rg.Tags
$rgname = $rg.ResourceGroupName

$resources = Get-AzureRmResource | where {$_.ResourceGroupName -like $rgname}


foreach ($resource in $resources)
{
    if ($resource.Tags -like $null)
    {
        Set-AzureRmResource -ResourceId $resource.ResourceId -Tag $rg.Tags 
    }
}
