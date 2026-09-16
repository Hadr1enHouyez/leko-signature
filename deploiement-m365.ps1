# Signature LEKO — déploiement par règle de flux Microsoft 365, en une commande.
# Prérequis : compte administrateur Exchange du tenant LEKO, module ExchangeOnlineManagement
#   (Install-Module ExchangeOnlineManagement -Scope CurrentUser), fichier signature-m365.html dans le même dossier.
# Usage :  .\deploiement-m365.ps1              -> crée la règle en mode TEST (rien n'est ajouté aux mails, résultats journalisés)
#          .\deploiement-m365.ps1 -Enforce     -> active la règle pour tous
#          .\deploiement-m365.ps1 -Pilote "pilote-signature@lekolabs.com" -Enforce   -> active pour un groupe pilote seulement
param(
  [switch]$Enforce,
  [string]$Pilote = "",
  [string]$Nom = "Signature LEKO",
  [string]$Fichier = "$PSScriptRoot\signature-m365.html"
)
$ErrorActionPreference = "Stop"
$html = Get-Content -Raw -Encoding UTF8 $Fichier
if ($html.Length -gt 5000) { throw "Le code fait $($html.Length) caractères, la limite Microsoft est 5000. Régénérez-le depuis le générateur (thème Clair ou Sombre)." }

Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -ShowBanner:$false

$params = @{
  Name                              = $Nom
  ApplyHtmlDisclaimerLocation       = "Append"
  ApplyHtmlDisclaimerText           = $html
  ApplyHtmlDisclaimerFallbackAction = "Ignore"
  ExceptIfSubjectOrBodyMatchesPatterns = "LEKO-SIG-2026"   # évite une seconde signature dans les réponses
  Mode                              = $(if ($Enforce) { "Enforce" } else { "Audit" })
  Comments                          = "Signature LEKO 2026 — générée le $(Get-Date -Format 'yyyy-MM-dd'). Desktop 500x150 + version mobile (plan 02)."
}
if ($Pilote) { $params.FromMemberOf = $Pilote } else { $params.FromScope = "InOrganization" }

$existante = Get-TransportRule -Identity $Nom -ErrorAction SilentlyContinue
if ($existante) {
  Set-TransportRule -Identity $Nom @params
  Write-Host "Règle « $Nom » mise à jour." -ForegroundColor Green
} else {
  New-TransportRule @params | Out-Null
  Write-Host "Règle « $Nom » créée." -ForegroundColor Green
}
Write-Host ("Mode : " + $(if ($Enforce) { "APPLIQUÉE à " + $(if ($Pilote) { $Pilote } else { "toute l'organisation" }) } else { "TEST (aucune signature ajoutée ; relancer avec -Enforce pour activer)" }))
Write-Host "Champs lus dans l'annuaire : Nom d'affichage, Fonction (EN), Notes (fonction FR), E-mail, Téléphone mobile."
Disconnect-ExchangeOnline -Confirm:$false
