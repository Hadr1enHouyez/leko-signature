# LEKO — Signature mail 2026 V8 (plan de travail 15)

Signature HTML de **388 × 218 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai`, plan de travail 15 (source ×2 = 873,62 × 444,71, fichier du 17 septembre 2026, 21 h 27). V8 reprend le texte et le visuel de la V7 (plan 07) et y ajoute **l'ombre portée du visuel** et une **tuile noire verticale séparée** (quatre angles arrondis, logo LEKO tourné à 90°) à 2,5 px du visuel. Le dossier `LEKO_Signature_2026_V7` reste en archive. Une seule mise en page pour tous les appareils : elle tient dans la zone de lecture des téléphones sans réduction. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## La mise en page

```
┌──────────────────────────────────────────────────┐
│      Prénom Nom               (Medium 15 px)     │
│      Fonction                 (Roman 12,5 px)    │
│                               (espace 22 px)     │
│   ┌──────────────────────────────┐  ┌────┐       │
│   │ visuel 319 × 143, coins 6,8  │  │ LE │       │
│   │ ombre portée ~11 px autour   │  │ KO │ 44 ×  │
│   │ CTA Revolt Green (bas droit) │  │    │ 143   │
│   └──────────────────────────────┘  └────┘       │
└──────────────────────────────────────────────────┘
```

- **Texte en haut à gauche, en texte réel** sur le fond du mail : rien qu'Outlook Windows puisse déformer. Deux lignes de texte, puis deux images.
- **Deux images fixes, identiques pour tout le monde** : le visuel **livré avec son ombre portée** (image de 333 × 164 : marges d'ombre de 11 px à gauche, en haut et en bas, coupée à 3 px à droite, soit l'écart de 2,5 px du fichier avec la tuile) et la tuile verticale 44 × 143 (quatre angles arrondis 6,25 px, logo LEKO tourné). Les deux images sont cliquables vers l'URL choisie.
- Géométrie du plan 15 (px à 100 %, mesurée depuis le bord du visuel) : texte à 8,2 px du bord gauche du visuel ; nom Medium 12 px (ligne de base 22,4 depuis le haut du plan) ; fonction Roman 10 px (34,6) ; visuel 319,3 × 142,5 ; ombre (image du fichier) débordant de 10,7 px ; tuile 44,2 × 142,5 à 2,5 px du visuel. Les larges marges du plan (34 px à gauche, 37 à droite, 32 en bas) ne sont pas reproduites : la signature commence au bord de son ombre.
- **Réglages hérités de la V7, à la demande de Hadrien (17 septembre 2026)** : polices agrandies (nom 15 px / interligne 16, fonction 12,5 px / interligne 14), 22 px entre le texte et le bord visible du visuel (11 px de cellule + 11 px de marge d'ombre), CTA de 15 px de diamètre centré à 8,7 px des bords droit et bas du visuel (le fichier a un CTA de 18,35 px). Hauteur totale 218 px (232 avec seconde ligne). Rendu vérifié dans Chromium : texte à x = 19, lignes de base 25 et 39,5, image du visuel à (0, 54) en 333 × 164 (visuel visible à (11, 65)), tuile à (333, 65) en 44 × 143.

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
| `visual-shadow-robotics@3x.png` / `.jpg` | 333 × 164 | ×3 (999 × 492) | **Visuel par défaut avec son ombre portée** : cadre d'ombre (image xref 100 du fichier, 681 × 328 avec son masque, agrandie ×1,5, coupée à 999 px de large) + visuel 957 × 429 posé à (33, 33), angles transparents 6,8 px, CTA 15 px ombré intégré. Le JPG (fond blanc) sert aux collages sans hébergement. |
| `visual-shadow-frame@3x.png` | — | ×3 (999 × 492) | Le cadre d'ombre seul, utilisé par le composeur de visuels personnalisés. |
| `logo-tile-tall-black@4x.png` / `logo-tile-tall-white@4x.png` | 44 × 143 | ×4 (176 × 572) | Tuile verticale : rendu du fichier (rectangle `[711,83, 95,64]–[800,31, 380,64]`, logo blanc tourné `[744,5, 144,8]–[767,6, 233]`), fond forcé noir pur, alpha = masque arrondi (rayon 12,51 ×2 = 6,25 px). Variante blanche par inversion RVB (thème sombre). |
| `cta-shadow@3x.png` | — | ×3 (119 × 120) | CTA 15 px avec son ombre, posé par le générateur à (882, 355) dans l'image 999 × 492 des visuels personnalisés. |
| `visual-robotics@3x.*`, `logo-tile-side-*@4x.png` | — | — | V8 plan 06 (17 septembre, 18 h 30) : conservés en ligne pour les signatures déjà collées, ne rien supprimer ni modifier. |

Les dossiers `assets/v7/` et `assets/` (V6) restent en ligne pour les signatures déjà collées : ne rien supprimer ni modifier.

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Texte** : cellule à `padding:12px 11px 11px 19px`, nom en `font-weight:600` 15 px / interligne 16 px, fonction en `normal` 12,5 px / interligne 14 px (`mso-line-height-rule:exactly`), pas d'interlettrage (mesuré nul sur le fichier). Une seconde ligne optionnelle s'ajoute sous la fonction ; l'espace sous le texte est fixe : 11 px de cellule + 11 px de marge d'ombre dans l'image = 22 px jusqu'au bord visible du visuel. Une fonction trop longue passe sur deux lignes et rehausse la signature : le générateur l'indique.
- **Aucun fond** dans le code : la signature s'affiche sur le fond du mail. Le bouton « Copier la signature » écrit le code exact dans le presse-papiers (API Clipboard, ou événement `copy` en secours) : le fond gris de la page du générateur ne peut pas être emporté, contrairement à une copie par sélection à la souris.
- **Images** : `width`/`height` fixes en attributs et en style, `display:block`. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît). La tuile est dans une cellule de 44 px à `padding:11px 0 10px 0` (elle s'aligne sur le visuel visible, 11 px sous le haut de l'image ombrée), directement à droite de la cellule du visuel, sans cellule intercalaire (l'écart de 2,5 px est dans l'image du visuel) ; la cellule extérieure a `padding-right:11px`, symétrique de la marge d'ombre gauche. L'ombre est un PNG semi-transparent : elle se fond sur tout fond de mail, et disparaît sur fond noir.
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

Par défaut 388 × 218 px, recommandée : elle s'affiche sans réduction sur les téléphones. L'étape 8 propose 125 % (485 × 273) et 150 % (583 × 327), qui seront réduits sur mobile. La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur.

## Mise en service

1. **Hébergement en place** : `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer, déplacer ni modifier un fichier hébergé : les signatures déjà collées portent des dimensions fixes et se déformeraient. Un nouveau contenu = un nouveau nom de fichier.
2. **Mise à jour** : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes. Pour un nouveau design, créer un nouveau sous-dossier d'assets (`v8/`…) et laisser les anciens en place.

## Transmettre une signature à un collègue

- **Lien en ligne** (dossier « Générateur de signature — Lien en ligne », raccourcis Mac et Windows) : chacun remplit ses champs et clique « Copier la signature ».
- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu ; il pointe toujours vers la version en ligne, même depuis la copie locale du générateur, et ouvre le générateur avec les champs déjà renseignés.
- **Fichier prêt à coller** : « Télécharger signature.htm » ; sur Mac ou Gmail, ouvrir dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature ; sur Outlook Windows, déposer `LEKO.htm` dans `%APPDATA%\Microsoft\Signatures`.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo paysage (≥ 957 × 429 px), régler le recadrage, télécharger le PNG produit (999 × 492 : ombre portée, angles arrondis, CTA ombré à la position du fichier), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce nom. « Un visuel déjà préparé en ligne » accepte directement une URL.

## Limites connues

- **Images bloquées** (expéditeur inconnu) : le destinataire voit le nom et la fonction en texte, mais ni le visuel ni la tuile logo tant qu'il n'autorise pas les images.
- **Mode sombre** : Outlook Windows et Gmail mobile peuvent recolorer le texte selon leur propre algorithme ; les images ne changent pas. Aucun correctif universel.
- **Poids** : le visuel PNG par défaut pèse 760 Ko (transparence, ×3). Hébergé, il n'alourdit pas les e-mails.
- **Gmail** n'affiche pas les webfonts : Helvetica à la place de Neue Haas pour le nom et la fonction.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF), plan de travail 15 = page 15 (873,62 × 444,71 ; le fichier compte 16 plans). Visuel : chemin de découpe `[68,31, 95,64]–[706,83, 380,64]`, rayon 13,61 ; photo (xref 75, 2094 × 792) placée à `(-6,3, 90,86)`, échelle 0,39146 pt/px : même fenêtre source que les plans 06/07 (`[190,6, 10,6]–[1821,7, 741,8]`), rééchantillonnée en 957 × 429. Ombre du visuel : image xref 100 (681 × 328, masque xref 113) placée à `[46,86, 74,09]–[727,86, 402,09]`, agrandie ×1,5. Tuile : rectangle noir `[711,83, 95,64]–[800,31, 380,64]`, rayon 12,51, rendu à 176 × 572 après suppression des images ; logo blanc `[744,54, 144,76]–[767,6, 232,95]`. CTA : ombre xref 103 (98 × 98) avec masque, cercle Revolt Green centré `(655,16, 328,97)` rayon 18,35 ; en service à l'échelle 1,2265 (15 px) posé à `(849, 322)` dans le visuel, soit `(882, 355)` dans l'image ombrée. Texte : `François Cordier` NeueHaasDisplay-Medium 24,01 origine `(84,75, 44,78)` ; fonction NeueHaasDisplay-Roman 20,01 origine `(84,75, 69,2)`. La couche BG ne peut pas être masquée par `set_layer` : les découpes se font par masque géométrique.

## Historique

- V6 (16 septembre 2026) : design 500 × 150 puis version mobile distincte, abandonnée (aucune méthode par collage ne permet de changer de mise en page sur mobile).
- V7 plans 01 à 03 (16–17 septembre 2026) : mise en page unique 398 × 251 avec tuile noire contenant le texte, puis tuile rendue en image par le générateur pour Outlook Windows.
- **V7 plan 07 (17 septembre 2026, 15 h) : version actuelle.** Texte hors tuile, visuel large et tuile logo fixe. 15 h 30 : polices agrandies (15 / 12,5 px) et espace texte → images doublé ; 15 h 45 : CTA réduit (13,5 px) et aligné sur le logo LEKO ; 16 h : CTA décalé à droite, écarts égaux aux bords droit et bas ; 16 h 15 : diamètre du CTA porté à 15 px, à la demande de Hadrien.
- **V8 plan 06 (17 septembre 2026, 18 h 30) : version actuelle.** Tuile verticale collée au visuel, logo LEKO tourné ; texte, visuel et CTA repris de la V7 réglée.
- **V8 plan 15 (17 septembre 2026, 21 h 45) : version actuelle.** Ombre portée sous le visuel, tuile verticale séparée à quatre angles arrondis (2,5 px du visuel), signature 388 × 218.
