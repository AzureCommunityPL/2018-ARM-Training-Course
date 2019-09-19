# Initialize Application information
    $client_id = "application ID"
    $secret = "Application Key or provided password"
    $tenant = "Tenat ID"

# Create credentials object

    $pass = ConvertTo-SecureString $secret -AsPlainText –Force
    $cred = New-Object -TypeName pscredential –ArgumentList $client_id, $pass

# Login to Azure with SPN

    Login-AzAccount -Credential $cred -ServicePrincipal -TenantId $tenant