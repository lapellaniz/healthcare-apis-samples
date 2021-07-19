## PowerShell
##variables
$resourcegroupname="rg-himss-demo"
$location="South Central US"
$workspacename="a1ws"
$dicomservicename="a33dicom"

##login to azure
Connect-AzAccount 
#Connect-AzAccount SubscriptionId cc148bf2-42fb-4913-a3fb-2f284a69eb89
#Set-AzContext -Subscription cc148bf2-42fb-4913-a3fb-2f284a69eb89
#Connect-AzAccount -Tenant 'xxxx-xxxx-xxxx-xxxx' -SubscriptionId 'yyyy-yyyy-yyyy-yyyy'
#Get-AzContext -ListAvailable
#Get-AzContext 


##create resource group
New-AzResourceGroup -Name $resourcegroupname -Location $location

##deploy the resource
New-AzResourceGroupDeployment -ResourceGroupName $resourcegroupname -TemplateFile "src/templates/dicomtemplate.json" -region $location -workspaceName $workspacename -dicomServiceName $dicomservicename
