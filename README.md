# LEKO — Signature mail 2026 V8 (plan de travail 14)

Signature HTML de **368 × 208 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai`, plan de travail 14 (source ×2 = 873,62 × 441,23, fichier du 18 septembre 2026, 14 h 38). V8 reprend le texte et le visuel de la V7 (plan 07) et y ajoute une **tuile noire verticale séparée** (quatre angles arrondis, logo LEKO tourné à 90° en bas de la tuile) à 5 px du visuel. **Texte et visuel sont justifiés ensemble à gauche, sans aucune marge** : la signature s'aligne sur le texte du corps du mail. Le dossier `LEKO_Signature_2026_V7` reste en archive. Une seule mise en page pour tous les appareils : elle tient dans la zone de lecture des téléphones sans réduction. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## La mise en page

```
┌──────────────────────────────────────────────┐
│Prénom Nom                 (Medium 15 px)     │
│Fonction                   (Roman 12,5 px)    │
│                           (espace 22 px)     │
│┌──────────────────────────────┐   ┌────┐     │
││ visuel 319 × 143, coins 6,8  │   │    │     │
││ CTA Revolt Green (bas droit) │   │ LE │ 44 ×│
││                              │   │ KO │ 143 │
│└──────────────────────────────┘   └────┘     │
└──────────────────────────────────────────────┘
```

- **Texte en haut à gauche, en texte réel** sur le fond du mail : rien qu'Outlook Windows puisse déformer. Deux lignes de texte, puis deux images. **Aucune marge** (`padding-left:0`) : le texte et le visuel partagent le même bord gauche, qui est celui du texte du corps du mail.
- **Deux images fixes, identiques pour tout le monde** : le visuel 319 × 143 (CTA intégré) et la tuile verticale 44 × 143 (quatre angles arrondis 6,25 px, logo LEKO tourné, à 16,7 px du bas), séparées par une cellule de 5 px. Les deux images sont cliquables vers l'URL choisie.
- Géométrie du plan 14 (px à 100 %) : texte à x = 0 du bord du visuel ; nom Medium 12 px (ligne de base 22,4 depuis le haut du plan) ; fonction Roman 10 px (34,6) ; visuel 319,3 × 142,5 ; tuile 44,2 × 142,5 à 5 px du visuel ; logo à 16,7 px du bas de la tuile. Les marges du plan (34 px à gauche et à droite, 30 en bas) servent à la présentation et ne sont pas reproduites.
- **Réglages hérités de la V7, à la demande de Hadrien (17 septembre 2026)** : polices agrandies (nom 15 px / interligne 16, fonction 12,5 px / interligne 14), 22 px entre le texte et le visuel, CTA de 15 px de diamètre (le fichier a un CTA de 18,35 px), **bas du cercle aligné sur le bas du L du logo LEKO** de la tuile (à 125,8 px du haut du visuel) et même écart au bord droit qu'au bord bas du visuel (17 px), réglage du 18 septembre. Hauteur totale 208 px (222 avec seconde ligne). Rendu vérifié dans Chromium : glyphes du texte à x = 0, lignes de base 25 et 39,5, visuel à (0, 65) en 319 × 143, tuile à (324, 65) en 44 × 143.

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
| `visual-robotics-2@3x.png` / `.jpg` | 319 × 143 | ×3 (957 × 429) | Visuel par défaut : fenêtre `[68,31, 95,64]–[706,83, 380,64]` du plan 14 (même cadrage que les plans 06/07), Lanczos depuis la photo 2094 × 792, angles transparents 6,8 px, CTA 15 px ombré intégré, bas du cercle à y = 377,5 @3x (bas du L du logo), à 51 px @3x des bords droit et bas. |
| `logo-tile-tall-2-black@4x.png` / `logo-tile-tall-2-white@4x.png` | 44 × 143 | ×4 (176 × 572) | Tuile verticale du plan 14 : rendu du fichier (rectangle `[716,83, 95,64]–[805,31, 380,64]`, logo blanc tourné `[749,5, 259,1]–[772, 347,3]`, en bas de la tuile), fond forcé noir pur, alpha = masque arrondi (rayon 12,51 ×2 = 6,25 px). Variante blanche par inversion RVB (thème sombre). |
| `cta-shadow@3x.png` | — | ×3 (119 × 120) | CTA 15 px avec son ombre, posé par le générateur à (824, 297) sur les visuels personnalisés. |
| `visual-robotics@3x.*` (CTA à 26 px des bords), `logo-tile-tall-black/white@4x.png` (plan 15, logo en haut), `visual-shadow-robotics@3x.*`, `visual-shadow-frame@3x.png` (plan 15 avec ombre), `logo-tile-side-*@4x.png` (plan 06) | — | — | Conservés en ligne pour les signatures déjà collées, ne rien supprimer ni modifier. |

Les dossiers `assets/v7/` et `assets/` (V6) restent en ligne pour les signatures déjà collées : ne rien supprimer ni modifier.

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Texte** : cellule à `padding:12px 0 22px 0`, nom en `font-weight:600` 15 px / interligne 16 px, fonction en `normal` 12,5 px / interligne 14 px (`mso-line-height-rule:exactly`), pas d'interlettrage (mesuré nul sur le fichier). Une seconde ligne optionnelle s'ajoute sous la fonction ; l'espace de 22 px sous le texte est fixe. Une fonction trop longue passe sur deux lignes et rehausse la signature : le générateur l'indique.
- **Aucun fond** dans le code : la signature s'affiche sur le fond du mail. Le bouton « Copier la signature » écrit le code exact dans le presse-papiers (API Clipboard, ou événement `copy` en secours) : le fond gris de la page du générateur ne peut pas être emporté, contrairement à une copie par sélection à la souris.
- **Images** : `width`/`height` fixes en attributs et en style, `display:block`. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît). La tuile est dans une cellule de 44 px à droite du visuel, séparée par une cellule intercalaire de 5 px (`font-size:1px;line-height:1px`) ; la cellule extérieure n'a aucun padding, la signature commence au bord gauche du corps du mail.
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

Par défaut 368 × 208 px, recommandée : elle s'affiche sans réduction sur les téléphones. L'étape 8 propose 125 % (460 × 260) et 150 % (553 × 313), qui seront réduits sur mobile. La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur.

## Mise en service

1. **Hébergement en place** : `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer, déplacer ni modifier un fichier hébergé : les signatures déjà collées portent des dimensions fixes et se déformeraient. Un nouveau contenu = un nouveau nom de fichier.
2. **Mise à jour** : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes. Pour un nouveau design, créer un nouveau sous-dossier d'assets (`v8/`…) et laisser les anciens en place.

## Transmettre une signature à un collègue

- **Lien en ligne** (dossier « Générateur de signature — Lien en ligne », raccourcis Mac et Windows) : chacun remplit ses champs et clique « Copier la signature ».
- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu ; il pointe toujours vers la version en ligne, même depuis la copie locale du générateur, et ouvre le générateur avec les champs déjà renseignés.
- **Fichier prêt à coller** : « Télécharger signature.htm » ; sur Mac ou Gmail, ouvrir dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature ; sur Outlook Windows, déposer `LEKO.htm` dans `%APPDATA%\Microsoft\Signatures`.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo paysage (≥ 957 × 429 px), régler le recadrage, télécharger le PNG produit (957 × 429 : angles arrondis, CTA ombré à la position du fichier), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce nom. « Un visuel déjà préparé en ligne » accepte directement une URL.

## Limites connues

- **Images bloquées** (expéditeur inconnu) : le destinataire voit le nom et la fonction en texte, mais ni le visuel ni la tuile logo tant qu'il n'autorise pas les images.
- **Mode sombre** : Outlook Windows et Gmail mobile peuvent recolorer le texte selon leur propre algorithme ; les images ne changent pas. Aucun correctif universel.
- **Poids** : le visuel PNG par défaut pèse 760 Ko (transparence, ×3). Hébergé, il n'alourdit pas les e-mails.
- **Gmail** n'affiche pas les webfonts : Helvetica à la place de Neue Haas pour le nom et la fonction.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF), plan de travail 14 = page 14 (873,62 × 441,23 ; le fichier compte 17 plans). Visuel : chemin de découpe `[68,31, 95,64]–[706,83, 380,64]`, rayon 13,61 ; photo (xref 77, 2094 × 792) placée à `(-6,3, 90,86)`, échelle 0,39146 pt/px : même fenêtre source que les plans 06/07/15 (`[190,6, 10,6]–[1821,7, 741,8]`), rééchantillonnée en 957 × 429. Tuile : rectangle noir `[716,83, 95,64]–[805,31, 380,64]`, rayon 12,51, rendu à 176 × 572 après suppression des images ; logo blanc `[749,54, 259,12]–[771,98, 347,31]`. CTA : ombre xref 105 (98 × 98) avec masque, cercle Revolt Green centré `(655,16, 328,97)` rayon 18,35 ; en service à l'échelle 1,2265 (15 px) posé à `(824, 297)` dans le visuel : bas du cercle sur le bas du L du logo (`347,31` ×2 → 377,5 @3x dans le visuel), écarts droit et bas égaux (51 px @3x). Texte : `François Cordier` NeueHaasDisplay-Medium 24,01 origine `(68,31, 44,78)` ; fonction NeueHaasDisplay-Roman 20,01 origine `(68,3, 69,2)` — même x que le bord du visuel. La couche BG ne peut pas être masquée par `set_layer` : les découpes se font par masque géométrique.

## Historique

- V6 (16 septembre 2026) : design 500 × 150 puis version mobile distincte, abandonnée (aucune méthode par collage ne permet de changer de mise en page sur mobile).
- V7 plans 01 à 03 (16–17 septembre 2026) : mise en page unique 398 × 251 avec tuile noire contenant le texte, puis tuile rendue en image par le générateur pour Outlook Windows.
- **V7 plan 07 (17 septembre 2026, 15 h) : version actuelle.** Texte hors tuile, visuel large et tuile logo fixe. 15 h 30 : polices agrandies (15 / 12,5 px) et espace texte → images doublé ; 15 h 45 : CTA réduit (13,5 px) et aligné sur le logo LEKO ; 16 h : CTA décalé à droite, écarts égaux aux bords droit et bas ; 16 h 15 : diamètre du CTA porté à 15 px, à la demande de Hadrien.
- **V8 plan 06 (17 septembre 2026, 18 h 30) : version actuelle.** Tuile verticale collée au visuel, logo LEKO tourné ; texte, visuel et CTA repris de la V7 réglée.
- **V8 plan 15 (17 septembre 2026, 21 h 45) : version actuelle.** Ombre portée sous le visuel, tuile verticale séparée à quatre angles arrondis (2,5 px du visuel), signature 388 × 218.
- **V8 plan 15 sans ombre (17 septembre 2026, 22 h) : version actuelle.** Ombre portée retirée ; visuel 319 × 143, écart 3 px, tuile verticale 44 × 143, signature 376 × 213.
- **V8 plan 14 (18 septembre 2026, 15 h) : version actuelle.** Texte et visuel justifiés à gauche sans marge, écart 5 px, tuile verticale avec logo en bas, signature 368 × 208.
- 18 septembre 2026, 15 h 30 : CTA aligné sur le bas du L du logo, écarts droit et bas égaux (17 px).
