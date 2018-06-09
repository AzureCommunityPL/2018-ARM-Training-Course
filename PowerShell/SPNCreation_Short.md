# Initialize

    $ErrorActionPreference = "Stop"
    $VerbosePreference = "SilentlyContinue"
    $userName = $env:USERNAME
    $newguid = [guid]::NewGuid()
    $displayName = [String]::Format("ARM.{0}.{1}", $userName, $newguid)
    $homePage = "http://" + $displayName
    $identifierUri = $homePage

# Get subscription
    
    $azureSubscription = (Get-AzureRmContext | select Subscription).Subscription
    $connectionName = $azureSubscription.Name
    $tenantId = $azureSubscription.TenantId
    $id = $azureSubscription.Id

# Set App Password

    [securestring]$password = Read-Host -AsSecureString -Prompt "Provide App Password"

# Create a new AD Application

    $azureAdApplication = New-AzureRmADApplication -DisplayName $displayName -HomePage $homePage -IdentifierUris $identifierUri -Password $password -Verbose
    $appId = $azureAdApplication.ApplicationId

# Create new SPN

    $spn = New-AzureRmADServicePrincipal -ApplicationId $appId
    $spnName = $spn.ServicePrincipalName


# Print the values
    Write-Output "`nCopy and Paste below values for Service Connection" -Verbose
    Write-Output "***************************************************************************"
    Write-Output "Connection Name: $connectionName(SPN)"
    Write-Output "Subscription Id: $id"
    Write-Output "Subscription Name: $connectionName"
    Write-Output "Service Principal Id: $appId"
    Write-Output "Service Principal key: <Password that you typed in>"
    Write-Output "Tenant Id: $tenantId"
    Write-Output "***************************************************************************"
