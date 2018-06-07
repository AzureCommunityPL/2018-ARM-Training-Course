$client_id = "application ID"
$secret = "Application Key or provided password"
$tenant = "Tenat ID"

$pass = ConvertTo-SecureString $secret -AsPlainText –Force
$cred = New-Object -TypeName pscredential –ArgumentList $client_id, $pass

Login-AzureRmAccount -Credential $cred -ServicePrincipal -TenantId $tenant