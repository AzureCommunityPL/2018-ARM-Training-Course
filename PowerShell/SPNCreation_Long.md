# Initialize

    $ErrorActionPreference = "Stop"
    $VerbosePreference = "SilentlyContinue"
    $userName = $env:USERNAME
    $newguid = [guid]::NewGuid()
    $displayName = [String]::Format("ARM.{0}.{1}", $userName, $newguid)
    $homePage = "http://" + $displayName
    $identifierUri = $homePage

# Import AzureARM module

    $isAzureModulePresent = Get-Module -Name AzureRM* -ListAvailable
    if ([String]::IsNullOrEmpty($isAzureModulePresent) -eq $true)
    {
        Write-Output "Script requires AzureRM modules to be present. Obtain AzureRM from https://github.com/Azure/azure-powershell/releases. Please refer https://github.com/Microsoft/vsts-tasks/blob/master/Tasks/DeployAzureResourceGroup/README.md for recommended AzureRM versions." -Verbose
        return
    }

    Import-Module -Name AzureRM.Profile

# Get subscription
    
    $azureSubscription = (Get-AzureRmContext | select Subscription).Subscription
    $connectionName = $azureSubscription.Name
    $tenantId = $azureSubscription.TenantId
    $id = $azureSubscription.Id

# Set App Password

    [securestring]$password = Read-Host -AsSecureString -Prompt "Provide App Password"

# Set SPN Role

    $spnRole = Read-Host -Prompt "Provide SPN Role"

# Create a new AD Application
    Write-Output "Creating a new Application in AAD (App URI - $identifierUri)" -Verbose
    $azureAdApplication = New-AzureRmADApplication -DisplayName $displayName -HomePage $homePage -IdentifierUris $identifierUri -Password $password -Verbose
    $appId = $azureAdApplication.ApplicationId
    Write-Output "Azure AAD Application creation completed successfully (Application Id: $appId)" -Verbose

# Create new SPN
    Write-Output "Creating a new SPN" -Verbose
    $spn = New-AzureRmADServicePrincipal -ApplicationId $appId
    $spnName = $spn.ServicePrincipalName
    Write-Output "SPN creation completed successfully (SPN Name: $spnName)" -Verbose

# Assign role to SPN
    Write-Output "Waiting for SPN creation to reflect in Directory before Role assignment"
    Start-Sleep 20
    Write-Output "Assigning role ($spnRole) to SPN App ($appId)" -Verbose
    New-AzureRmRoleAssignment -RoleDefinitionName $spnRole -ServicePrincipalName $appId
    Write-Output "SPN role assignment completed successfully" -Verbose

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
