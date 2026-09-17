# LEKO — Signature mail 2026 V7 (plan de travail 07)

Signature HTML de **400 × 213 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai`, plan de travail 07 (source ×2 = 800 × 390,64, fichier du 17 septembre 2026, 14 h 42). Une seule mise en page pour tous les appareils : elle tient dans la zone de lecture des téléphones sans réduction. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## La mise en page

```
┌────────────────────────────────────────────────────┐
│  Prénom Nom                 (Medium 15 px, noir)   │
│  Fonction                   (Roman 12,5 px, noir)  │
│                             (espace 22 px)         │
│ ┌──────────────────────────────────┐  ┌──────┐     │
│ │  visuel 319 × 143, coins 6,8 px  │  │ tuile│     │
│ │  CTA Revolt Green ombré (bas dr.)│  │ noire│     │
│ │                                  │  │ LEKO │     │
│ └──────────────────────────────────┘  └──────┘     │
└────────────────────────────────────────────────────┘
```

- **Texte en haut à gauche, en texte réel** sur le fond du mail : plus aucune tuile derrière le nom. C'est ce qui règle définitivement le rendu d'Outlook Windows, qui déformait le bloc noir contenant du texte (interlignes, coins, retours à la ligne). Il n'y a plus rien à déformer : deux lignes de texte, puis deux images.
- **Deux images fixes, identiques pour tout le monde** : le visuel (319 × 143, CTA intégré) et la tuile logo (64 × 143, noire à logo blanc). Aucune image à produire par personne, donc Gmail est servi comme les autres clients. Les deux images sont cliquables vers l'URL choisie.
- Géométrie du plan 07 (px à 100 %) : texte à x = 13,2 ; nom Medium 12 px (ligne de base 22,4) ; fonction Roman 10 px (34,6) ; visuel à (5, 47,8) ; tuile à (329,3, 47,8) ; marge droite 7,1 ; marge basse 5.
- **Écarts demandés le 17 septembre 2026 (15 h 30)** : polices agrandies (nom 15 px / interligne 16, fonction 12,5 px / interligne 14) et espace texte → images doublé (22 px au lieu de 11), fixe même avec une seconde ligne. Hauteur totale 213 px (227 avec seconde ligne). Rendu vérifié dans Chromium : lignes de base 25 et 39,5, images à (5, 65) et (329, 65).

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `generateur.html` | **Point d'entrée pour les collaborateurs.** Formulaire (prénom, nom, fonction, seconde ligne optionnelle, lien), thème, aperçu en temps réel avec la police Neue Haas embarquée, copie de la signature, export `.htm`, lien pré-rempli (toujours vers la version en ligne), composition d'un visuel personnalisé, export pour règle de flux Microsoft 365. Identique en ligne et dans ce dossier. |
| `signature-exemple.html` | Exemple complet du code généré (thème clair, champs neutres, images hébergées, 2,9 Ko). |
| `signature-m365.html` | Code compact pour une règle de flux Microsoft 365 (jetons `%%FirstName%%`, `%%LastName%%`, `%%Title%%`, 1 482 caractères pour 5 000 autorisés). |
| `deploiement-m365.md`, `deploiement-m365.ps1` | Procédure et script pour le déploiement centralisé côté serveur, si LEKO le souhaite un jour. |
| `assets/v7/` | Images, **hébergées** sur GitHub Pages dans le même sous-dossier. Les images des versions précédentes restent en ligne pour les mails déjà envoyés : ne rien supprimer ni modifier. |
| `assets/fonts/` | Webfonts Neue Haas Grotesk Display Pro (Medium, Roman), sous-ensemble latin ; utilisées par l'aperçu du générateur et par l'option webfont. |

### Assets du plan 07

| Fichier | Taille affichée | Résolution | Rôle |
|---|---|---|---|
| `visual-wide-robotics-3@3x.png` / `.jpg` | 319 × 143 | ×3 (957 × 429) | Visuel par défaut : fenêtre `[10, 95,6]–[648,5, 380,6]` du fichier, rééchantillonnée en Lanczos depuis la photo source 2094 × 792, angles transparents (rayon 13,6 ×2 = 6,8 px), **CTA ombré intégré**. Le CTA est réduit par rapport au fichier (demande du 17 septembre, 15 h 45) : diamètre 13,5 px au lieu de 18,35, soit un peu plus que la hauteur du logo LEKO (11,5 px), centré sur la ligne médiane du logo (y = 127,2 px) et décalé vers la droite pour que l'écart au bord droit du visuel soit égal à l'écart au bord bas (9 px, l'espacement de référence ; demande de 16 h). Le JPG (angles blancs, 120 Ko) sert aux collages sans hébergement. |
| `logo-tile-black@4x.png` / `logo-tile-white@4x.png` | 64 × 143 | ×4 (256 × 572) | Tuile logo : rendu direct du fichier (rectangle noir, rayon 15 ×2 = 7,5 px, logo LEKO blanc en bas), alpha = masque arrondi ; variante blanche par inversion RVB pour le thème sombre. |
| `cta-shadow-4@3x.png` | — | ×3 (107 × 108) | CTA réduit avec son ombre (ombre = raster du fichier avec son masque, cercle = rendu vectoriel, le tout à l'échelle 0,736), posé par le générateur à (858, 328) sur les visuels personnalisés. |
| `visual-wide-robotics@3x.*`, `visual-wide-robotics-2@3x.*`, `cta-shadow-3@3x.png` (plan 07, CTA avant réduction et décalage), `tuiles/*`, `tile-*`, `logo-*`, `visual-robotics*`, `cta-shadow*`, `cta-shadow-2*` | — | — | Versions précédentes (plans 01 à 03) : conservées en ligne pour les signatures déjà collées, ne rien supprimer ni modifier. |

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Texte** : cellule à `padding:12px 7px 22px 13px`, nom en `font-weight:600` 15 px / interligne 16 px, fonction en `normal` 12,5 px / interligne 14 px (`mso-line-height-rule:exactly`), pas d'interlettrage (mesuré nul sur le fichier). Une seconde ligne optionnelle s'ajoute sous la fonction ; l'espace de 22 px sous le texte est fixe. Une fonction trop longue passe sur deux lignes et rehausse la signature : le générateur l'indique.
- **Aucun fond** dans le code : la signature s'affiche sur le fond du mail. Le bouton « Copier la signature » écrit le code exact dans le presse-papiers (API Clipboard, ou événement `copy` en secours) : le fond gris de la page du générateur ne peut pas être emporté, contrairement à une copie par sélection à la souris.
- **Images** : `width`/`height` fixes en attributs et en style, `display:block`. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît). Écart de 5 px entre visuel et tuile par une cellule intercalaire.
- **Largeur minimale** sur le tableau : empêche Gmail mobile d'écraser la mise en page.
- **Netteté** : visuel ×3, tuile ×4, affichés à la taille ×1 par les attributs.
- **Poids de police** : les fichiers Neue Haas installés déclarent Medium en 600 et Roman en 500 ; le nom est en `font-weight:600`, la fonction en `normal`. Pile `'Neue Haas Grotesk Display Pro', 'Neue Haas Display', 'Helvetica Neue', Helvetica, Arial`.

## Thèmes

| Thème | Rendu | Quand l'utiliser |
|---|---|---|
| **Clair** | Texte noir, tuile noire à logo blanc | Version de référence, pour les fonds de mail clairs (la quasi-totalité des cas) |
| **Sombre** | Inversé à 100 % : texte blanc, tuile blanche à logo noir | Uniquement pour un fond de mail sombre ; le texte blanc est invisible sur fond blanc |
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

Le fichier `.ai` est compatible PDF (PyMuPDF), plan de travail 07 = page 7 (800 × 390,64). Visuel : chemin de découpe `[10, 95,64]–[648,53, 380,64]`, rayon 13,61 ; photo (xref 50, 2094 × 792) placée à `(-64,6, 90,86)`, échelle 0,39146 pt/px, d'où la fenêtre source `[190,6, 10,6]–[1821,7, 741,8]` rééchantillonnée en 957 × 429. CTA : ombre = image xref 73 (97 × 98) avec son masque ; cercle Revolt Green centré `(596,85, 328,97)`, rayon 18,35, rendu sans la photo. Version en service : le tout à l'échelle 1,1038 (au lieu de 1,5) pour un diamètre de 40,5 px @3x, posé à `(858, 328)` : cercle centré à environ `(910, 381,6)`, ligne médiane du logo de la tuile, à 27 px @3x des bords droit et bas. Tuile : rectangle `[658,53, 95,64]–[785,77, 380,64]`, rayon 15, rendu à 256 × 572 avec masque arrondi ; logo blanc `[678,4, 338,5]–[766,5, 361,6]`. Texte : `François Cordier` NeueHaasDisplay-Medium 24,01 origine `(26,45, 44,78)` ; fonction NeueHaasDisplay-Roman 20,01 origine `(26,45, 69,2)`. La couche BG ne peut pas être masquée par `set_layer` dans ce fichier : les découpes se font par masque géométrique.

## Historique

- V6 (16 septembre 2026) : design 500 × 150 puis version mobile distincte, abandonnée (aucune méthode par collage ne permet de changer de mise en page sur mobile).
- V7 plans 01 à 03 (16–17 septembre 2026) : mise en page unique 398 × 251 avec tuile noire contenant le texte, puis tuile rendue en image par le générateur pour Outlook Windows.
- **V7 plan 07 (17 septembre 2026, 15 h) : version actuelle.** Texte hors tuile, visuel large et tuile logo fixe. 15 h 30 : polices agrandies (15 / 12,5 px) et espace texte → images doublé ; 15 h 45 : CTA réduit (13,5 px) et aligné sur le logo LEKO ; 16 h : CTA décalé à droite, écarts égaux (9 px) aux bords droit et bas, à la demande de Hadrien.
