# LEKO — Signature mail 2026 V7

Signature HTML de **398 × 251 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V7.ai` (plan de travail 03, source ×2 = 800 × 502, version du 17 septembre 2026, 13 h 30). Une seule mise en page pour tous les appareils : sa largeur tient dans la zone de lecture des téléphones sans réduction, le texte y garde sa taille réelle. Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android.

Générateur en ligne : **https://hadr1enhouyez.github.io/leko-signature/generateur.html**

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `generateur.html` | **Point d'entrée pour les collaborateurs.** Formulaire (prénom, nom, champ 1, champ 2, lien), thème, aperçu en temps réel, **rendu de la tuile noire en image PNG** (texte et logo dessinés par le générateur), copie de la signature, export `.htm`, téléchargement de la tuile PNG, lien pré-rempli, composition d'un visuel personnalisé, export pour règle de flux Microsoft 365. Identique en ligne et dans ce dossier. |
| `signature-exemple.html` | Exemple complet du code généré (thème clair, champs neutres, images hébergées, tuile hébergée `assets/v7/tuiles/exemple.png`). |
| `signature-m365.html` | Code compact pour une règle de flux Microsoft 365 (jetons d'annuaire `%%FirstName%%`, `%%LastName%%`, `%%Title%%`, `%%Notes%%`, 1 723 caractères pour 5 000 autorisés). |
| `deploiement-m365.md`, `deploiement-m365.ps1` | Procédure et script pour le déploiement centralisé côté serveur, si LEKO le souhaite un jour. |
| `assets/v7/` | Images du design V7, **hébergées** sur GitHub Pages dans le même sous-dossier. Les images des versions précédentes restent en ligne à la racine `assets/` du dépôt pour les mails déjà envoyés : ne rien supprimer. |
| `assets/fonts/` | Webfonts Neue Haas Grotesk Display Pro (Medium, Roman), sous-ensemble latin. Chargées aussi par le générateur pour dessiner la tuile. |
| `assets/v7/tuiles/` | Tuiles noires PNG **par personne**, déposées ici pour être hébergées (voir « Tuile noire en image »). `exemple.png` = champs neutres. |

### Assets V7 (plan de travail 03)

| Fichier | Taille affichée | Résolution | Rôle |
|---|---|---|---|
| `visual-robotics-2@3x.png` / `.jpg` | 388 × 143 | ×3 (1164 × 429) | Visuel par défaut, rééchantillonné en Lanczos depuis la photo source, angles transparents (rayon 6,7 px comme le fichier), **CTA ombré intégré** |
| `logo-white-4@4x.png` / `logo-black-4@4x.png` | 114 × 31 | ×4 (456 × 124) | Grand logo LEKO à droite de la tuile ; PNG à fond transparent (alpha issu de la luminance du rendu blanc sur noir), marge de 2 px ; blanc sur tuile noire, noir sur tuile blanche |
| `tile-top-black-2@4x.png` / `tile-bottom-black-2@4x.png` (+ `-white-2`) | 388 × 8 | ×4 (1552 × 32) | Angles de la tuile (rayon 6 px), **Outlook Windows uniquement** (bloc conditionnel) |
| `cta-shadow-2@3x.png` | — | ×3 | CTA avec son ombre, posé par le générateur sur les visuels personnalisés |
| `tuiles/<prenom-nom>.png` | 388 × 93 | ×3 (1164 × 279) | Tuile noire d'une personne (nom, deux champs, logo), produite par le bouton « Télécharger la tuile PNG », angles transparents (rayon 6 px), environ 25 Ko |
| anciens fichiers (`visual-robotics@3x`, `logo-*`, `logo-*-2`, `logo-*-3`, `tile-*@4x`, `cta-shadow@3x`) | — | — | Conservés en ligne pour les signatures copiées avec les designs précédents : ne rien supprimer ni modifier |

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Tuile noire en image** (depuis le 17 septembre 2026, 13 h 30) : le générateur dessine la tuile complète (fond noir à coins arrondis 6 px, prénom-nom, deux champs, logo) dans un canvas ×3 (1164 × 279) avec la webfont Neue Haas, et l'insère comme une seule image `<img width=388 height=93>`. Le rendu est donc **identique dans tous les clients**, y compris Outlook Windows, dont le moteur Word déformait le bloc en texte HTML (interlignes, retours à la ligne, coins). Les champs restent éditables dans le formulaire : chaque modification redessine l'image. Sans URL de tuile hébergée, l'image est intégrée en base64 dans le code copié (~30 Ko) : accepté par Outlook Windows/Mac, Apple Mail et Outlook mobile ; **Gmail supprime les images base64** dans les signatures, d'où l'option de tuile hébergée (voir plus bas). Les tranches `tile-*-2@4x` et le bloc conditionnel Outlook ne servent plus qu'à l'export « règle de flux Microsoft 365 », qui garde une tuile en texte HTML (jetons d'annuaire).
- **Texte** (plan de travail 03) : à gauche, prénom et nom en Medium 12,5 px puis deux champs libres en Roman 9 px (fonction anglaise et française, ou autre) ; à droite, grand logo LEKO 114 × 31 aligné au bord droit. Plus d'e-mail ni de téléphone dans ce design. Interlettrage +0,2 px sur les champs. Lignes de base vérifiées à ±0,4 px contre le plan de travail. Un seul préréglage de taille.
- **Liens** : le visuel et son CTA pointent vers l'URL de l'étape 3 (par défaut `https://www.lekolabs.com`). Plus de `mailto:` ni de `tel:` dans ce design.
- **Visuel** : PNG à angles transparents avec CTA intégré, en `width`/`height` fixes. Jamais de `max-width:100%` ni `height:auto` dans une cellule de tableau (WebKit / Apple Mail résout le pourcentage à zéro et l'image disparaît).
- **Largeur minimale** sur le tableau : empêche Gmail mobile d'écraser la mise en page.
- **Netteté** : tuile ×3, visuel ×3, logo ×4 (dans la tuile), affichés via les attributs `width`/`height` à la taille ×1.
- **Poids de police** : dans la tuile dessinée, le nom est en Neue Haas Medium (webfont, graisse 600) et les champs en Roman (400) ; les tailles et positions reprennent le plan de travail 03 (nom 12,5 px, ligne de base 55,4 ; champs 9 px, lignes de base 65,4 et 74,4 ; interlettrage +0,2 px ; réduction automatique si le texte dépasse 230 px). La police est donc affichée partout, Gmail compris, puisqu'elle est dans l'image.

## Thèmes clair / sombre

| Thème | Rendu | Quand l'utiliser |
|---|---|---|
| **Clair** | Tuile noire, texte blanc | Version de référence, identique partout |
| **Sombre** | Tuile blanche, texte noir | Statique, identique partout |
| **Automatique** | Clair par défaut, bascule en sombre quand le client du destinataire applique le mode sombre | Uniquement pour une installation par fichier (`.htm`, `.mailsignature`) ou par outil serveur. Au collage, les éditeurs suppriment le bloc `<style>` ou en affichent le texte : le bouton « Copier la signature » copie donc la version claire quand ce thème est choisi |

Le logo suit le thème : blanc sur tuile noire, noir sur tuile blanche ; en thème automatique, les deux images de tuile (claire et sombre) sont présentes et permutées par le bloc de style (uniquement possible sans tuile hébergée, donc uniquement pour une installation par fichier).

## Police Neue Haas Grotesk Display

Pile `'Neue Haas Grotesk Display Pro', 'Helvetica Neue', Helvetica, Arial`. L'option **7 · Intégrer la police en webfont** ajoute des déclarations `@font-face` (Medium et Roman, `assets/fonts/`, licence Commercial Type confirmée). Affichée dans Apple Mail, iOS Mail, Outlook Mac et Outlook iOS ; ignorée par Gmail, Outlook Windows (qui reçoit Arial via un style conditionnel, sinon il se replie sur Times New Roman), le nouveau Outlook et Outlook.com. Aucun client mail ne permet de garantir la police partout.

## Taille d'affichage

Par défaut 398 × 251 px, la taille du fichier source, recommandée : elle s'affiche sans réduction sur les téléphones. L'étape 8 propose 125 % (498 × 313) et 150 % (597 × 379), qui seront réduits sur mobile. La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur.

## Mise en service

1. **Hébergement en place** : `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer ni déplacer ces fichiers : chaque e-mail déjà envoyé y fait référence. Changer d'hébergement obligerait tout le monde à recopier sa signature.
2. **Mise à jour** : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes. Pour un nouveau design, créer un nouveau sous-dossier d'assets (`v8/`…) et laisser les anciens en place.

## Transmettre une signature à un collègue

- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu ; le lien ouvre le générateur en ligne avec les champs déjà renseignés, le collègue clique « Copier la signature ».
- **Fichier prêt à coller** : « Télécharger signature.htm » ; sur Mac ou Gmail, ouvrir dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature ; sur Outlook Windows, déposer `LEKO.htm` dans `%APPDATA%\Microsoft\Signatures`.

## Tuile noire en image : hébergement par personne (Gmail)

Le code copié intègre la tuile en base64, ce que Gmail refuse dans les signatures (l'image disparaît). Pour un utilisateur Gmail, ou pour alléger le code :

1. Dans le générateur, remplir les champs puis cliquer **« Télécharger la tuile PNG »** (fichier `tuile-<prenom-nom>.png`, 1164 × 279, thème courant ; `-sombre` pour le thème sombre).
2. Déposer le fichier dans `assets/v7/tuiles/` du dépôt (`git push`, en ligne une à deux minutes après). Ne jamais écraser un fichier existant sous le même nom : republier sous un nouveau nom si la tuile change.
3. Coller l'URL `https://hadr1enhouyez.github.io/leko-signature/assets/v7/tuiles/<prenom-nom>.png` à l'étape 5 « URL de votre tuile noire hébergée ». Le générateur vérifie que l'image répond et mesure 1164 px de large, puis le code copié pointe vers elle (code d'environ 2 Ko, sans base64).

Le lien pré-rempli transporte aussi cette URL. `exemple.png` correspond aux champs neutres du générateur.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo paysage (≥ 1164 × 429 px), régler le recadrage, télécharger le PNG produit (angles arrondis, CTA ombré ajouté à la position du fichier), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce fichier. Pour un visuel commun, le déposer une fois et donner son URL à chacun (« Un visuel déjà préparé en ligne »).

## Version mobile distincte : pourquoi il n'y en a pas

Afficher une mise en page différente sur mobile exige un bloc `<style>` (media query). Les éditeurs de signature d'Outlook Mac, Apple Mail et Gmail le suppriment au collage, ainsi que les substitutions par `calc()` ou `vw` (testé le 16 septembre 2026). Le design V7 contourne le problème : une seule mise en page de 398 px, lisible telle quelle sur téléphone. Un déploiement côté serveur (règle de flux Microsoft 365, Exclaimer, CodeTwo) resterait la seule voie pour une bascule automatique ; le matériel est dans `deploiement-m365.md`.

## Limites connues

- **Images bloquées** (expéditeur inconnu) : la tuile étant une image, le destinataire ne voit ni le nom ni le visuel tant qu'il n'autorise pas les images ; l'attribut `alt` porte le prénom, le nom et les deux champs.
- **Gmail** : la tuile en base64 est supprimée au collage ; utiliser une tuile hébergée (section ci-dessus).
- **Mode sombre** : Outlook Windows et Gmail mobile peuvent recolorer la tuile selon leur propre algorithme ; aucun correctif universel.
- **Poids** : le visuel PNG par défaut pèse 880 Ko (transparence, ×3). Hébergé, il n'alourdit pas les e-mails ; la variante JPG (120 Ko, angles blancs) existe pour les collages sans hébergement.
- **Webfont** : plus nécessaire pour la tuile (police dans l'image) ; l'option 7 n'a d'effet que sur le texte éventuellement ajouté hors tuile.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF), plan de travail 03 (page 3). Tuile `[10,11]–[785.8,196.9]` (rayon 12 ×2 = 6 px) : tranches `y 11–27` et `y 180.9–196.9` rendues à ×2 avec fond transparent, variantes blanches par inversion RVB. Visuel : fenêtre `[10,206.9]–[785.8,491.9]` de la photo source, Lanczos vers 1164 × 429, masque arrondi mesuré sur le fichier (6,7 px ×3), CTA ombré (zone `[685.5,391.5]–[783.5,489.5]`, posé en (1013, 277)) rendu après suppression de la photo. Logo : rendu ×2 de la zone `[522.4,100.8]–[750.1,162.6]` avec tous les calques (blanc sur noir), alpha = luminance, recadré sur les lettres avec 2 px de marge (456 × 124). Ne pas se fier au masquage des calques de PyMuPDF pour ce fichier : le fond noir reste rendu. **Règle** : une image publiée ne change jamais de proportions sous le même nom, les signatures déjà collées en dépendent ; on publie un nouveau fichier.
