# Déployer la signature LEKO par une règle de flux Microsoft 365

Une règle de flux Exchange Online (« Appliquer une clause ») ajoute le code HTML de la signature à chaque message au moment de l'envoi, côté serveur. Le client de l'expéditeur n'intervient plus : le code arrive intact chez les destinataires, y compris le bloc de style qui affiche la version mobile du plan de travail 02 sur les téléphones. Aucune manipulation par les collaborateurs.

Source : [Organization-wide message disclaimers, signatures, footers, or headers in Exchange Online](https://learn.microsoft.com/en-us/exchange/security-and-compliance/mail-flow-rules/disclaimers-signatures-footers-or-headers) et [New-TransportRule](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/new-transportrule).

> **Différence avec la signature collée** : depuis le 17 septembre 2026, le générateur rend la tuile noire en **image** pour le collage manuel. Une règle de flux ne peut pas produire une image par personne, donc l'export « Microsoft 365 » garde une **tuile en texte HTML** (jetons d'annuaire, bloc conditionnel Outlook pour les angles). Son rendu dans Outlook Windows dépend du moteur Word : coins carrés et interlignes approximatifs sont possibles.

## Ce qu'il faut savoir avant de commencer

| Point | Détail |
|---|---|
| Droits | Administrateur Exchange (rôle « Mail flow » / Gestion de l'organisation) sur le tenant Microsoft 365 de LEKO. |
| Limite de taille | 5 000 caractères pour le texte de la clause. Le générateur produit un code compact et affiche le compteur. |
| Champs dynamiques | Jetons d'annuaire remplacés à l'envoi : `%%FirstName%%`, `%%LastName%%`, `%%Title%%` (champ 1), `%%Notes%%` (champ 2). La fonction en français est lue dans le champ **Notes** de l'utilisateur, à renseigner pour chacun (voir plus bas). |
| Position | La clause est ajoutée **à la fin du corps du message**. Dans une réponse, elle se retrouve donc sous le message cité, pas sous le texte tapé. C'est la limite principale de cette méthode, que les outils payants (Exclaimer, CodeTwo) contournent avec un complément Outlook. |
| Brouillon | L'expéditeur ne voit pas la signature en rédigeant ; elle apparaît dans le message reçu et dans « Éléments envoyés ». |
| Doublons | Une exception sur un marqueur invisible (`LEKO-SIG-2026`, présent dans le code) évite d'ajouter la signature à chaque réponse du fil. |

## 1. Préparer les fiches utilisateurs

Dans le centre d'administration Microsoft 365 (`admin.microsoft.com` › Utilisateurs › Utilisateurs actifs › fiche › Informations de contact), renseigner pour chaque collaborateur :

- **Prénom** et **Nom** : affichés sur deux lignes.
- **Fonction** (Job title) : fonction en anglais, première ligne.

La seconde ligne (fonction en français) utilise le champ **Notes**, absent de l'interface Microsoft 365 : le renseigner dans le centre d'administration Exchange (`admin.exchange.microsoft.com` › Destinataires › Boîtes aux lettres › boîte › Général › Notes) ou en PowerShell :

```powershell
Set-User -Identity prenom@lekolabs.com -Notes "Directeur de Création & Marque"
```

## 2. Produire le code

1. Ouvrir le générateur, régler thème, taille et, si souhaité, cocher **9 · Ajouter la version mobile**. Laisser le thème sur **Clair** ou **Sombre** (le thème automatique ajoute un second bloc de style et alourdit le code).
2. En bas de la page, section **Déploiement centralisé**, cliquer **Copier le code pour une règle de flux M365**. Le compteur doit rester sous 5 000 caractères.
3. Coller ce code dans un fichier texte `signature-m365.html` pour archive. Un fichier prêt à l'emploi est livré dans ce dossier (design V7, plan 03, thème clair, 100 % : 1 723 caractères).

Le code contient les jetons à la place des valeurs saisies et le marqueur invisible `LEKO-SIG-2026`.

## 3. Créer la règle dans le centre d'administration Exchange

1. Ouvrir `https://admin.exchange.microsoft.com/#/transportrules` › **Ajouter une règle** › **Appliquer des clauses d'exclusion de responsabilité**.
2. **Nom** : `Signature LEKO`.
3. **Appliquer cette règle si** : `L'expéditeur` › `est interne/externe` › **À l'intérieur de l'organisation**. Pour limiter aux messages sortants, ajouter la condition `Le destinataire` › `est interne/externe` › **À l'extérieur de l'organisation** (sinon la signature s'ajoute aussi aux mails internes).
4. **Effectuer les actions suivantes** : `Appliquer une clause d'exclusion de responsabilité au message` › **ajouter une clause** › **Entrer le texte** : coller le code de l'étape 2 › Enregistrer. **Sélectionner une** (action de secours) : **Ignorer** (le message part sans signature si elle ne peut pas être insérée, par exemple message chiffré ; ne pas choisir « Envelopper »).
5. **Sauf si** : `L'objet ou le corps` › `l'objet ou le corps correspond à ces modèles de texte` › saisir `LEKO-SIG-2026` › Ajouter › Enregistrer. Cette exception empêche une seconde signature dans les réponses et transferts.
6. **Suivant**. **Mode de la règle** : commencer par **Tester sans conseils de stratégie**, ou **Appliquer** directement si les tests ci-dessous ont déjà été faits sur un compte pilote. Laisser les autres réglages par défaut. **Suivant** › **Terminer**.

La règle est active en quelques minutes (jusqu'à une heure pour la propagation).

### Variante PowerShell

Le script `deploiement-m365.ps1` livré dans ce dossier fait tout en une commande : `.\deploiement-m365.ps1` crée la règle en mode test, `.\deploiement-m365.ps1 -Enforce` l'active, `-Pilote "groupe@lekolabs.com"` la limite à un groupe. Équivalent manuel :

```powershell
Connect-ExchangeOnline
$html = Get-Content -Raw -Encoding UTF8 .\signature-m365.html
New-TransportRule -Name "Signature LEKO" `
  -FromScope InOrganization `
  -ApplyHtmlDisclaimerLocation Append `
  -ApplyHtmlDisclaimerText $html `
  -ApplyHtmlDisclaimerFallbackAction Ignore `
  -ExceptIfSubjectOrBodyMatchesPatterns "LEKO-SIG-2026" `
  -Mode Enforce
```

Pour restreindre à un groupe pilote pendant les tests, remplacer `-FromScope InOrganization` par `-FromMemberOf "pilote-signature@lekolabs.com"`.

## 4. Tester avant d'ouvrir à tous

Depuis un compte pilote, envoyer vers une adresse externe et vérifier :

1. Sur ordinateur (Apple Mail, Outlook Windows, Gmail web) : version desktop, champs remplis, liens e-mail et téléphone actifs, images affichées.
2. Sur téléphone (Apple Mail iOS, Gmail, Outlook) : version du plan 02 si la version mobile a été cochée et si le bloc de style a été conservé. Sinon, version desktop réduite.
3. Répondre au message reçu et vérifier qu'aucune seconde signature ne s'ajoute.
4. Envoyer un message en texte brut : Exchange le convertit en HTML pour insérer la clause, contrôler le rendu.

## 5. Désactiver les signatures locales

Une fois la règle en production, chaque collaborateur retire sa signature locale dans Outlook ou Apple Mail pour ne pas en avoir deux. Les signatures locales existantes n'empêchent pas la règle de s'appliquer.

## Alternatives payantes

Exclaimer et CodeTwo (environ 1 à 2 € par utilisateur et par mois) s'appuient sur les mêmes jetons d'annuaire, mais ajoutent la signature sous le texte de la réponse et la montrent dans le brouillon via un complément Outlook, avec un éditeur de modèles et une gestion par service ou par campagne. Le fichier `signature.htm` téléchargé depuis le générateur (version mobile cochée) leur sert de modèle tel quel.
