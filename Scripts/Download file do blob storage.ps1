# Script PowerShell para Download de backup do blobstorage para VM no Azure
# Autor: Sidney Oliviera Cirqueira
# Engenheiro de Dados | Analista de Banco de Dados 

# Pre-Requisitos:
# 1 - PowerShell e modulo do Azure devidamente instalados no servidor de destino;
# Referencia: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-2.2.0
# 2 - Versao do AzCopy devidamente instalada no servidor de destino;
# Referencia: https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
# 3 - Permissao administrativa de acesso ao BlobStorage;
# Referencia: https://docs.microsoft.com/bs-latn-ba/azure/storage/common/storage-access-blobs-queues-portal

# Inicio Script 

#Logar no Azure 

Login-AzureRmAccount

#[opcional] Logar remotamente no servidor de destino do download 

enter-PSSession -ComputerName #informe servidor remoto que deseja realizar o download

#Credencial de acesso ao blobstorage

$SubscriptionName = "informe o nome da sua subscription"

$ResourceName = "informe o nome do seu Resource Group"

$srcStorageAccount = "informe sua storage account"

$srcStorageKey = 'informe a key da storage account'

$srcContainer = "informe o container" 

#Nome do Backup a ser baixado

$file = "nome do seu arquivo.bak"

#Comando que inicializa o Azcopy no servidor desejado

Set-Location "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy"

#Os parametros abaixo significam:

#/Source = Link do Container que o blob sera baixado

#/Dest = Diretorio local que sera baixado o arquivo .bak

.\AzCopy.exe /Source:https://informeaquiaurldeacessoaoblob /Dest:pastaparadonwload /SourceKey:$srcStorageKey /Pattern:$file /Y

#[opcional] Deslogar da sessao remota
Exit-PSSession
