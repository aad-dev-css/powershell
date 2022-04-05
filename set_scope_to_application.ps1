#################################################################################
#DISCLAIMER:
#This code-sample is provided "AS IT IS" without warranty of any kind, either expressed or implied, including but not limited to the implied warranties of merchantability and/or fitness for a particular purpose.
#This sample is not supported under any Microsoft standard support program or service. 
#Microsoft further disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a particular purpose. 
#The entire risk arising out of the use or performance of the sample and documentation remains with you. 
#In no event shall Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the script be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary loss) arising out of  the use of or inability to use the sample or documentation, even if Microsoft has been advised of the possibility of such damages.
#################################################################################

#Set Scope to Application v1.0
#Script by Manuel Magalhães

$tenantId = "Tenant ID Here"
$appObjectId = "Application Object ID Here"
$identifierUris = "https://tenantname.onmicrosoft.com/api.name"

Connect-MgGraph -Scopes ("Application.ReadWrite.All") -TenantId $tenantId

$id = [guid]::NewGuid().guid #create a new guid for a scope

$scopes = @() #scope array

$scope = @{
 AdminConsentDescription = "Test Description"
 AdminConsentDisplayName = "Test Display Name"
 IsEnabled = $true
 Value = "TestValue"
 Lang = $null
 Id = $id
}

$scopes += $scope #adds scope to array

$api = @{
 AcceptMappedClaims = $true
 Oauth2PermissionScopes = $scopes
 RequestedAccessTokenVersion = 2
} #api object with scopes

Update-MgApplication -ApplicationId $appObjectId -Api $api -IdentifierUris $identifierUris