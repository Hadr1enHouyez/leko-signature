# LEKO — Signature mail 2026 V7

Signature HTML de **398 × 301 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai` (plan de travail unique, source ×2 = 800 × 600, version finale du 16 septembre 2026, 23 h 30). Une seule mise en page pour tous les appareils : sa largeur tient dans la zone de lecture des téléphones sans réduction, le texte y garde sa taille réelle. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `generateur.html` | **Point d'entrée pour les collaborateurs.** Formulaire (prénom, nom, fonctions, e-mail, téléphone, lien), thème, aperçu en temps réel, copie de la signature, export `.htm`, lien pré-rempli, composition d'un visuel personnalisé, export pour règle de flux Microsoft 365. Identique en ligne et dans ce dossier. |
| `signature-exemple.html` | Exemple complet du code généré (thème clair, champs neutres, images hébergées). |
| `signature-m365.html` | Code compact pour une règle de flux Microsoft 365 (jetons d'annuaire, 2 212 caractères pour 5 000 autorisés). |
| `deploiement-m365.md`, `deploiement-m365.ps1` | Procédure et script pour le déploiement centralisé côté serveur, si LEKO le souhaite un jour. |
| `assets/v7/` | Images du design V7, **hébergées** sur GitHub Pages dans le même sous-dossier. Les images des versions précédentes restent en ligne à la racine `assets/` du dépôt pour les mails déjà envoyés : ne rien supprimer. |
| `assets/fonts/` | Webfonts Neue Haas Grotesk Display Pro (Medium, Roman), sous-ensemble latin. |

### Assets V7

| Fichier | Taille affichée | Résolution | Rôle |
|---|---|---|---|
| `visual-robotics@3x.png` / `.jpg` | 388 × 143 | ×3 (1164 × 429) | Visuel par défaut, rééchantillonné en Lanczos depuis la photo source, angles transparents, **CTA ombré intégré** (une seule image cliquable) |
| `logo-white@4x.png` / `logo-black@4x.png` | 34 × 9 | ×4 (136 × 36) | Logo LEKO dans la tuile, en bas à gauche au-dessus des fonctions ; blanc sur tuile noire, noir sur tuile blanche |
| `tile-top-black@4x.png` / `tile-bottom-black@4x.png` (+ `-white`) | 388 × 8 | ×4 (1552 × 32) | Angles de la tuile, **Outlook Windows uniquement** (bloc conditionnel) |
| `cta-shadow@3x.png` | — | ×3 | CTA avec son ombre, extrait du fichier source ; posé par le générateur sur les visuels personnalisés à la position du fichier |

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Tuile noire** : une seule cellule à fond noir et coins arrondis CSS (7,5 px à l'écran = 15 px du fichier ×2), texte réel à l'intérieur. Aucune jonction d'images, donc aucun filet sur mobile. Apple Mail, iOS, Gmail, Outlook Mac, Outlook mobile, Outlook.com et le nouveau Outlook arrondissent les coins ; Outlook classique Windows reçoit un bloc conditionnel en trois rangées (tranches d'angles en images) qui n'est lu qu'à l'installation par fichier `.htm` ; collée, la tuile y a des coins carrés.
- **Texte** : prénom et nom sur une ligne en Medium 26 px en haut ; en bas à gauche, logo LEKO 34 × 9 puis fonctions (Roman 8 px, deux lignes) ; en bas à droite, e-mail souligné et téléphone (Roman 9 px) alignés à droite, le téléphone sur la ligne de base de la seconde fonction. Interlettrage +0,2 / +0,28 px comme dans le fichier. Lignes de base vérifiées à ±0,5 px contre le plan de travail. Préréglage « Lisible » : fonctions 9 px, contacts 10 px.
- **Liens** : e-mail (`mailto:`) souligné, téléphone (`tel:`) non souligné ; couleur et soulignement répétés sur une balise imbriquée dans le lien, car Outlook Windows applique son style « Lien hypertexte » à la balise elle-même.
- **Visuel** : PNG à angles transparents avec CTA intégré, en `width`/`height` fixes. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît).
- **Largeur minimale** sur le tableau : empêche Gmail mobile d'écraser la mise en page.
- **Netteté** : tranches ×4, visuel ×3, affichés via les attributs `width`/`height` à la taille ×1.
- **Poids de police** : les fichiers Neue Haas installés déclarent Medium en 600 et Roman en 500 ; le nom est en `font-weight:600`, le reste en `normal`.

## Thèmes clair / sombre

| Thème | Rendu | Quand l'utiliser |
|---|---|---|
| **Clair** | Tuile noire, texte blanc | Version de référence, identique partout |
| **Sombre** | Tuile blanche, texte noir | Statique, identique partout |
| **Automatique** | Clair par défaut, bascule en sombre quand le client du destinataire applique le mode sombre | Uniquement si le code est installé par fichier : les éditeurs de signature suppriment le bloc `<style>` au collage et la version claire s'affiche alors |

Le logo suit le thème : blanc sur tuile noire, noir sur tuile blanche ; en thème automatique, la paire est permutée par le bloc de style.

## Police Neue Haas Grotesk Display

Pile `'Neue Haas Grotesk Display Pro', 'Helvetica Neue', Helvetica, Arial`. L'option **7 · Intégrer la police en webfont** ajoute des déclarations `@font-face` (Medium et Roman, `assets/fonts/`, licence Commercial Type confirmée). Affichée dans Apple Mail, iOS Mail, Outlook Mac et Outlook iOS ; ignorée par Gmail, Outlook Windows (qui reçoit Arial via un style conditionnel, sinon il se replie sur Times New Roman), le nouveau Outlook et Outlook.com. Aucun client mail ne permet de garantir la police partout.

## Taille d'affichage

Par défaut 398 × 301 px, la taille du fichier source, recommandée : elle s'affiche sans réduction sur les téléphones. L'étape 8 propose 125 % (498 × 376) et 150 % (597 × 451), qui seront réduits sur mobile. La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur.

## Mise en service

1. **Hébergement en place** : `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer ni déplacer ces fichiers : chaque e-mail déjà envoyé y fait référence. Changer d'hébergement obligerait tout le monde à recopier sa signature.
2. **Mise à jour** : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes. Pour un nouveau design, créer un nouveau sous-dossier d'assets (`v8/`…) et laisser les anciens en place.

## Transmettre une signature à un collègue

- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu ; le lien ouvre le générateur en ligne avec les champs déjà renseignés, le collègue clique « Copier la signature ».
- **Fichier prêt à coller** : « Télécharger signature.htm » ; sur Mac ou Gmail, ouvrir dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature ; sur Outlook Windows, déposer `LEKO.htm` dans `%APPDATA%\Microsoft\Signatures`.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo paysage (≥ 1164 × 429 px), régler le recadrage, télécharger le PNG produit (angles arrondis, CTA ombré ajouté à la position du fichier), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce fichier. Pour un visuel commun, le déposer une fois et donner son URL à chacun (« Un visuel déjà préparé en ligne »).

## Version mobile distincte : pourquoi il n'y en a pas

Afficher une mise en page différente sur mobile exige un bloc `<style>` (media query). Les éditeurs de signature d'Outlook Mac, Apple Mail et Gmail le suppriment au collage, ainsi que les substitutions par `calc()` ou `vw` (testé le 16 septembre 2026). Le design V7 contourne le problème : une seule mise en page de 398 px, lisible telle quelle sur téléphone. Un déploiement côté serveur (règle de flux Microsoft 365, Exclaimer, CodeTwo) resterait la seule voie pour une bascule automatique ; le matériel est dans `deploiement-m365.md`.

## Limites connues

- **Images bloquées** (expéditeur inconnu) : le destinataire voit la tuile avec le texte mais sans visuel ni logo, jusqu'à ce qu'il autorise les images.
- **Mode sombre** : Outlook Windows et Gmail mobile peuvent recolorer la tuile selon leur propre algorithme ; aucun correctif universel.
- **Poids** : le visuel PNG par défaut pèse 880 Ko (transparence, ×3). Hébergé, il n'alourdit pas les e-mails ; la variante JPG (120 Ko, angles blancs) existe pour les collages sans hébergement.
- **Gmail** n'affiche pas les webfonts : Helvetica à la place de Neue Haas.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF). Tuile noire `[10,10]–[785.8,295]` (rayon 15) : tranches `y 10–26` et `y 279–295` rendues à ×2 de la source avec fond transparent, variantes blanches par inversion RVB. Visuel : recadrage de la photo source correspondant à la fenêtre `[10,305]–[785.8,590]`, Lanczos vers 1164 × 429, masque arrondi 22,5 px, puis composition du CTA ombré (zone rendu après suppression de la photo. Logo : zone `[48,198.7]–[116.4,216.6]` du calque FIXED rendue à ×2 (136 × 36), variante noire par inversion RVB. CTA : zone `[685.2,489.6]–[783.2,587.6]`, posé en (1013, 277).
