# LEKO — Signature mail 2026 V8 (plan de travail 06)

Signature HTML de **400 × 213 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai`, plan de travail 06 (source ×2 = 800 × 390,64, fichier du 17 septembre 2026, 18 h 13). V8 reprend la V7 (plan 07) en remplaçant la tuile logo carrée par une **tuile noire verticale, collée au bord droit du visuel**, avec le logo LEKO tourné à 90°. Le dossier `LEKO_Signature_2026_V7` reste en archive. Une seule mise en page pour tous les appareils : elle tient dans la zone de lecture des téléphones sans réduction. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## La mise en page

```
┌────────────────────────────────────────────────────┐
│  Prénom Nom                 (Medium 15 px, noir)   │
│  Fonction                   (Roman 12,5 px, noir)  │
│                             (espace 22 px)         │
│ ┌──────────────────────────────────┐┐              │
│ │  visuel 319 × 143, coins 6,8 px  ││ tuile 37 ×   │
│ │  CTA Revolt Green ombré (bas dr.)││ 128, LEKO    │
│ │                                  ││ vertical     │
│ └──────────────────────────────────┘┘              │
└────────────────────────────────────────────────────┘
```

- **Texte en haut à gauche, en texte réel** sur le fond du mail : rien qu'Outlook Windows puisse déformer. Deux lignes de texte, puis deux images.
- **Deux images fixes, identiques pour tout le monde** : le visuel (319 × 143, CTA intégré) et la tuile verticale (37 × 128). Dans le fichier, la tuile est un rectangle noir qui passe **derrière** le visuel et dépasse à droite ; seule la partie visible est livrée en image, collée sans écart au bord droit du visuel, en retrait de 7,5 px en haut et en bas, angles droits arrondis 6,6 px. Les deux images sont cliquables vers l'URL choisie.
- Géométrie du plan 06 (px à 100 %) : texte à x = 13,2 ; nom Medium 12 px (ligne de base 22,4) ; fonction Roman 10 px (34,6) ; visuel à (5, 47,8) ; tuile visible de x = 324,3 à 361,5, de y = 55,3 à 182,8 ; marge droite 38,5 (le tableau garde 400 px de large, la marge est transparente).
- **Réglages hérités de la V7, à la demande de Hadrien (17 septembre 2026)** : polices agrandies (nom 15 px / interligne 16, fonction 12,5 px / interligne 14), espace texte → images de 22 px (fixe, même avec une seconde ligne), CTA de 15 px de diamètre centré à 8,7 px des bords droit et bas du visuel (le fichier a un CTA de 18,35 px). Hauteur totale 213 px (227 avec seconde ligne). Rendu vérifié dans Chromium : visuel à (5, 65), tuile à (324, 72) en 37 × 128.

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `generateur.html` | **Point d'entrée pour les collaborateurs.** Formulaire (prénom, nom, fonction, seconde ligne optionnelle, lien), thème, aperçu en temps réel avec la police Neue Haas embarquée, copie de la signature, export `.htm`, lien pré-rempli (toujours vers la version en ligne), composition d'un visuel personnalisé, export pour règle de flux Microsoft 365. Identique en ligne et dans ce dossier. |
| `signature-exemple.html` | Exemple complet du code généré (thème clair, champs neutres, images hébergées, 2,9 Ko). |
| `signature-m365.html` | Code compact pour une règle de flux Microsoft 365 (jetons `%%FirstName%%`, `%%LastName%%`, `%%Title%%`, 1 482 caractères pour 5 000 autorisés). |
| `deploiement-m365.md`, `deploiement-m365.ps1` | Procédure et script pour le déploiement centralisé côté serveur, si LEKO le souhaite un jour. |
| `assets/v8/` | Images, **hébergées** sur GitHub Pages dans le même sous-dossier. Les images des versions précédentes restent en ligne pour les mails déjà envoyés : ne rien supprimer ni modifier. |
| `assets/fonts/` | Webfonts Neue Haas Grotesk Display Pro (Medium, Roman), sous-ensemble latin ; utilisées par l'aperçu du générateur et par l'option webfont. |

### Assets V8 (`assets/v8/`)

| Fichier | Taille affichée | Résolution | Rôle |
|---|---|---|---|
| `visual-robotics@3x.png` / `.jpg` | 319 × 143 | ×3 (957 × 429) | Visuel par défaut, identique à `v7/visual-wide-robotics-4@3x` : fenêtre `[10, 95,6]–[648,5, 380,6]` du fichier, Lanczos depuis la photo 2094 × 792, angles transparents 6,8 px, CTA 15 px ombré intégré à 26 px @3x des bords droit et bas. |
| `logo-tile-side-black@4x.png` / `logo-tile-side-white@4x.png` | 37 × 128 | ×4 (148 × 512) | Partie visible de la tuile verticale : rendu du fichier (rectangle `[648,53, 110,64]–[722,91, 365,64]`, logo blanc tourné `[672,5, 248]–[695,5, 336]`), fond forcé noir pur, alpha = masque à angles droits arrondis (rayon 13,14 ×2 = 6,6 px), angles gauches droits. Variante blanche par inversion RVB (thème sombre). |
| `cta-shadow@3x.png` | — | ×3 (119 × 120) | CTA 15 px avec son ombre, posé par le générateur à (849, 322) sur les visuels personnalisés (identique à `v7/cta-shadow-5@3x`). |

Les dossiers `assets/v7/` et `assets/` (V6) restent en ligne pour les signatures déjà collées : ne rien supprimer ni modifier.

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Texte** : cellule à `padding:12px 7px 22px 13px`, nom en `font-weight:600` 15 px / interligne 16 px, fonction en `normal` 12,5 px / interligne 14 px (`mso-line-height-rule:exactly`), pas d'interlettrage (mesuré nul sur le fichier). Une seconde ligne optionnelle s'ajoute sous la fonction ; l'espace de 22 px sous le texte est fixe. Une fonction trop longue passe sur deux lignes et rehausse la signature : le générateur l'indique.
- **Aucun fond** dans le code : la signature s'affiche sur le fond du mail. Le bouton « Copier la signature » écrit le code exact dans le presse-papiers (API Clipboard, ou événement `copy` en secours) : le fond gris de la page du générateur ne peut pas être emporté, contrairement à une copie par sélection à la souris.
- **Images** : `width`/`height` fixes en attributs et en style, `display:block`. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît). La tuile est dans une cellule de 37 px à `padding:7px 0 8px 0` (7,5 px dans le fichier), directement à droite de la cellule du visuel, sans cellule intercalaire ; la cellule extérieure garde `padding-right:39px`.
- **Largeur minimale** sur le tableau : empêche Gmail mobile d'écraser la mise en page.
- **Netteté** : visuel ×3, tuile ×4, affichés à la taille ×1 par les attributs.
- **Poids de police** : les fichiers Neue Haas installés déclarent Medium en 600 et Roman en 500 ; le nom est en `font-weight:600`, la fonction en `normal`. Pile `'Neue Haas Grotesk Display Pro', 'Neue Haas Display', 'Helvetica Neue', Helvetica, Arial`.

## Thèmes

| Thème | Rendu | Quand l'utiliser |
|---|---|---|
| **Clair** | Texte noir, tuile verticale noire à logo blanc | Version de référence, pour les fonds de mail clairs (la quasi-totalité des cas) |
| **Sombre** | Inversé à 100 % : texte blanc, tuile verticale blanche à logo noir | Uniquement pour un fond de mail sombre ; le texte blanc est invisible sur fond blanc |
| **Automatique** | Clair par défaut, bascule en sombre quand le client du destinataire applique le mode sombre au contenu | Uniquement pour une installation par fichier (`.htm`, `.mailsignature`) ou par outil serveur. Au collage, les éditeurs suppriment le bloc `<style>` : le bouton « Copier la signature » copie donc la version claire |

En thème automatique, les deux tuiles (noire et blanche) sont dans le code et permutées par le bloc de style ; la couleur du texte suit.

## Police Neue Haas Grotesk Display

Le générateur charge les webfonts embarquées pour l'aperçu : la signature s'y affiche en Neue Haas même sur un poste sans la police. Chez les destinataires, la police installée est utilisée si elle existe, sinon Helvetica / Arial. L'option **7 · Intégrer la police en webfont** ajoute des déclarations `@font-face` (Medium et Roman, `assets/fonts/`, licence Commercial Type confirmée) : Apple Mail, iOS Mail, Outlook Mac et Outlook iOS l'affichent ; Gmail, Outlook Windows et Outlook.com ignorent les webfonts (Outlook Windows reçoit Arial par un bloc conditionnel pour éviter Times New Roman).

## Taille d'affichage

Par défaut 400 × 213 px (largeur du fichier source), recommandée : elle s'affiche sans réduction sur les téléphones. L'étape 8 propose 125 % (500 × 266) et 150 % (600 × 320), qui seront réduits sur mobile. La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur.

## Mise en service

1. **Hébergement en place** : `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer, déplacer ni modifier un fichier hébergé : les signatures déjà collées portent des dimensions fixes et se déformeraient. Un nouveau contenu = un nouveau nom de fichier.
2. **Mise à jour** : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes. Pour un nouveau design, créer un nouveau sous-dossier d'assets (`v8/`…) et laisser les anciens en place.

## Transmettre une signature à un collègue

- **Lien en ligne** (dossier « Générateur de signature — Lien en ligne », raccourcis Mac et Windows) : chacun remplit ses champs et clique « Copier la signature ».
- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu ; il pointe toujours vers la version en ligne, même depuis la copie locale du générateur, et ouvre le générateur avec les champs déjà renseignés.
- **Fichier prêt à coller** : « Télécharger signature.htm » ; sur Mac ou Gmail, ouvrir dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature ; sur Outlook Windows, déposer `LEKO.htm` dans `%APPDATA%\Microsoft\Signatures`.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo paysage (≥ 957 × 429 px), régler le recadrage, télécharger le PNG produit (angles arrondis, CTA ombré ajouté à la position du fichier), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce nom. « Un visuel déjà préparé en ligne » accepte directement une URL.

## Limites connues

- **Images bloquées** (expéditeur inconnu) : le destinataire voit le nom et la fonction en texte, mais ni le visuel ni la tuile logo tant qu'il n'autorise pas les images.
- **Mode sombre** : Outlook Windows et Gmail mobile peuvent recolorer le texte selon leur propre algorithme ; les images ne changent pas. Aucun correctif universel.
- **Poids** : le visuel PNG par défaut pèse 760 Ko (transparence, ×3). Hébergé, il n'alourdit pas les e-mails.
- **Gmail** n'affiche pas les webfonts : Helvetica à la place de Neue Haas pour le nom et la fonction.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF), plan de travail 06 = page 6 (800 × 390,64 ; le fichier compte 11 plans). Visuel : chemin de découpe `[10, 95,64]–[648,53, 380,64]`, rayon 13,61 ; photo (xref 66, 2094 × 792) placée à `(-64,6, 90,86)`, échelle 0,39146 pt/px, d'où la fenêtre source `[190,6, 10,6]–[1821,7, 741,8]` rééchantillonnée en 957 × 429. Tuile : rectangle noir `[605,34, 110,64]–[722,91, 365,64]` (angles droits arrondis 13,14, angles gauches sous le visuel), rendu de la seule partie visible `[648,53 → 722,91]` à 148 × 512 après suppression des images ; logo blanc `[672,5, 247,95]–[695,55, 336,15]`. CTA : voir V7 (ombre xref 87 98 × 98 avec masque, cercle Revolt Green centré `(596,85, 328,97)` rayon 18,35, en service à l'échelle 1,2265 posé à `(849, 322)`). Texte : `François Cordier` NeueHaasDisplay-Medium 24,01 origine `(26,45, 44,78)` ; fonction NeueHaasDisplay-Roman 20,01 origine `(26,45, 69,2)`. La couche BG ne peut pas être masquée par `set_layer` : les découpes se font par masque géométrique.

## Historique

- V6 (16 septembre 2026) : design 500 × 150 puis version mobile distincte, abandonnée (aucune méthode par collage ne permet de changer de mise en page sur mobile).
- V7 plans 01 à 03 (16–17 septembre 2026) : mise en page unique 398 × 251 avec tuile noire contenant le texte, puis tuile rendue en image par le générateur pour Outlook Windows.
- **V7 plan 07 (17 septembre 2026, 15 h) : version actuelle.** Texte hors tuile, visuel large et tuile logo fixe. 15 h 30 : polices agrandies (15 / 12,5 px) et espace texte → images doublé ; 15 h 45 : CTA réduit (13,5 px) et aligné sur le logo LEKO ; 16 h : CTA décalé à droite, écarts égaux aux bords droit et bas ; 16 h 15 : diamètre du CTA porté à 15 px, à la demande de Hadrien.
- **V8 plan 06 (17 septembre 2026, 18 h 30) : version actuelle.** Tuile verticale collée au visuel, logo LEKO tourné ; texte, visuel et CTA repris de la V7 réglée.
