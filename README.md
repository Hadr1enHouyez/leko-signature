# LEKO — Signature mail 2026 V6 (plan de travail 01)

Signature HTML de **500 × 150 px**, construite à partir de `Artwork/Signature_Mail_LEKO_2026_V6.ai` (plan de travail 01, source ×2 = 1000 × 300).
Compatible Outlook (classique et nouveau, Windows et Mac), Gmail, Apple Mail, iOS/Android. Trois thèmes : clair, sombre, automatique.

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `generateur.html` | **Point d'entrée pour les collaborateurs.** Formulaire (nom, fonctions, e-mail, téléphone, lien), choix du thème, aperçu en temps réel, copie de la signature, export `.htm`, composition d'un visuel personnalisé. Fonctionne hors ligne, à ouvrir dans Chrome, Edge ou Safari. |
| `assets/` | Images **à héberger**, voir tableau ci-dessous. |
| `signature-exemple.html` | Exemple complet du code généré (thème clair, champs neutres, images hébergées). |

### Assets

| Fichier | Taille affichée | Résolution | Rôle |
|---|---|---|---|
| `tile-top-black@4x.png` / `tile-top-white@4x.png` | 200 × 8 | ×4 (800 × 32) | Angles supérieurs de la tuile, **Outlook Windows uniquement** (bloc conditionnel), noire (thème clair) ou blanche (thème sombre) |
| `tile-bottom-black@4x.png` / `tile-bottom-white@4x.png` | 200 × 32 | ×4 (800 × 128) | Angles inférieurs et logo, **Outlook Windows uniquement** |
| `logo-white@4x.png` / `logo-black@4x.png` | 38 × 10 | ×4 (152 × 40) | Logo LEKO seul, rendu depuis le vecteur, posé dans la tuile à coins arrondis CSS (clients modernes) |
| `visual-robotics@3x.png` | 285 × 140 | ×3 (855 × 420) | Visuel par défaut, rééchantillonné en Lanczos depuis la photo source 6000 px, angles transparents, CTA et ombre portée inclus (580 Ko) |
| `visual-robotics@3x.jpg` | 285 × 140 | ×3 | Même visuel, angles blancs, 84 Ko — pour les collages sans hébergement |
| `visual-robotics-mobile@3x.png` / `.jpg` | 224 × 140 | ×3 (672 × 420) | Visuel de la version mobile (plan de travail 02) : même photo, recadrage centré, CTA et ombre à la même place |
| `cta-shadow@3x.png` | — | ×3 (141 × 141) | Pastille Revolt Green + flèche + ombre portée, extraite du fichier source ; utilisée par le générateur pour composer un visuel personnalisé |
| `reference-artboard-01@2x.png` | — | ×2 | Rendu du plan de travail 01, pour contrôle |
| `fonts/NeueHaasGroteskDisplayPro-65Medium.woff2` / `-55Roman.woff2` (+ `.woff`) | — | — | Webfonts, sous-ensemble latin (15 Ko chacune), pour l'option « Intégrer la police » |

## Comment la signature est construite

- **Tableaux HTML imbriqués et styles inline** uniquement : seule structure rendue à l'identique par le moteur Word d'Outlook Windows.
- **Tuile noire** : une seule cellule à fond noir et coins arrondis CSS (7,5 px à l'écran = 15 px du fichier ×2, comme les angles du visuel), avec le logo LEKO en PNG ×4 à l'intérieur. Aucune jonction d'images : c'est ce qui supprime les filets clairs que produisaient les tranches sur iOS Mail, Outlook mobile et Gmail mobile quand le mail est réduit à l'écran. Apple Mail, iOS, Gmail, Outlook Mac, Outlook mobile, Outlook.com et le nouveau Outlook arrondissent tous les coins en CSS.
- **Outlook classique Windows** ignore les coins arrondis CSS. Le code contient un bloc conditionnel réservé à Word (`<!--[if mso]>`) avec la tuile en trois rangées : tranche haute, cellule noire, tranche basse avec logo, angles cuits dans les images. Ce bloc n'est lu que si la signature est installée par le fichier `.htm` (dossier `Signatures`) ; une signature **collée** dans Outlook Windows perd les commentaires conditionnels et affiche la tuile à coins carrés.
- **Visuel** : PNG à angles transparents, CTA et ombre inclus, une seule image cliquable.
- **Gmail mobile** : Gmail n'affiche pas les webfonts (Helvetica à la place) et agrandissait les petits textes en réduisant la signature de 500 px à l'écran ; la version mobile, affichée à sa taille native, supprime cette réduction. Ne jamais mettre `max-width:100%` ou `height:auto` sur le visuel dans une cellule de tableau : WebKit (Apple Mail) résout alors le pourcentage à zéro et l'image disparaît.
- **Netteté** : les tranches (dont le logo) sont fournies en ×4, le visuel en ×3, tous affichés via les attributs `width`/`height` à la taille ×1. Un écran Retina (×2) ou une loupe ×2 dans le générateur restent nets.
- **Texte réel, éditable et cliquable** : nom, fonctions, e-mail (`mailto:`), téléphone (`tel:`). Police : Neue Haas Grotesk Display Pro si installée chez le destinataire, sinon Helvetica Neue / Helvetica / Arial. Tailles : nom 15 px, fonctions 8,5 px, contacts 10 px (préréglage « Lisible » : 16 / 9,5 / 11). Graisses : nom en Medium, fonctions et contacts en Roman. Le bloc nom + fonction est posé à 19 px du haut de la tuile, comme de la gauche.
- **Liens** : le visuel et la flèche Revolt Green forment une seule image cliquable vers l'URL choisie, modifiable dans le générateur.

## Thèmes clair / sombre

| Thème | Rendu | Quand l'utiliser |
|---|---|---|
| **Clair** | Tuile noire, texte et logo blancs | Version de référence. Identique dans tous les clients. |
| **Sombre** | Tuile blanche, texte et logo noirs | Si l'on préfère une version claire à l'écran, ou pour une communication sur fond sombre. Statique, identique partout. |
| **Automatique** | Clair par défaut, bascule en sombre quand le client du destinataire applique le mode sombre au contenu | Apple Mail, iOS Mail, Outlook Mac, Outlook iOS/Android, Outlook.com et nouveau Outlook. Gmail et Outlook Windows classique affichent la version claire. |

Le thème automatique repose sur un bloc `<style>` (`@media (prefers-color-scheme: dark)` et sélecteurs `[data-ogsc]`/`[data-ogsb]` d'Outlook.com) qui inverse la couleur de la cellule et du texte et **permute les images** de la tuile (paire noire/blanche, la seconde masquée par `display:none` et `mso-hide:all`). Aucun client ne permet de faire mieux :

- **Gmail** supprime tout bloc `<style>` : version claire, toujours.
- **Outlook classique Windows** ignore les media queries. En mode sombre il inverse de lui-même les cellules (tuile noire → blanche, texte → noir) mais laisse les images : les angles et le logo restent ceux du thème choisi. C'est le comportement d'Outlook pour toutes les signatures du marché.
- **Gmail mobile** recolore parfois les fonds selon son propre algorithme.

Le générateur propose « Simuler le mode sombre du destinataire » pour visualiser la bascule du thème automatique.

## Police Neue Haas Grotesk Display

Le texte utilise la pile `'Neue Haas Grotesk Display Pro', 'Helvetica Neue', Helvetica, Arial`. Sans autre mesure, la police n'apparaît que chez les destinataires qui l'ont installée.

L'option **7 · Intégrer la police en webfont** ajoute des déclarations `@font-face` (Medium pour le nom, Roman pour les fonctions, l'e-mail et le téléphone), chargées depuis `assets/fonts/` si le dossier est hébergé, sinon intégrées en base64 (+ 40 Ko dans le code). Ce que cela donne chez le destinataire :

| Client | Webfont |
|---|---|
| Apple Mail, iOS Mail | Affichée |
| Outlook Mac, Outlook iOS/Android | Affichée dans la plupart des versions |
| Outlook classique Windows | Ignorée. Les déclarations lui sont masquées et un style conditionnel lui impose Arial, sinon Outlook se replie sur Times New Roman en présence de webfonts |
| Nouveau Outlook Windows, Outlook.com | Ignorée, Helvetica / Arial |
| Gmail (web et mobile) | Ignorée, Helvetica / Arial |

Il n'existe donc aucun moyen de garantir la police dans tous les clients : c'est une limite des clients mail, pas de la signature. Seule une image du texte le permettrait, au prix de l'éditabilité, de la sélection et du rendu en mode sombre.

**Licence** : les fichiers proviennent de Commercial Type (EULA « Font Software »). La diffusion en webfont depuis un serveur LEKO relève d'une licence web distincte de la licence poste : à vérifier auprès de Commercial Type avant d'héberger `assets/fonts/`.

**Hébergement des polices** : le serveur doit renvoyer l'en-tête `Access-Control-Allow-Origin: *` sur le dossier `fonts/` (les navigateurs et WebKit refusent les polices d'une autre origine sans cet en-tête) et le type MIME `font/woff2`.

## Version mobile (plan de travail 02)

Sur les téléphones, la signature affiche la mise en page du plan de travail 02 : tuile 224 × 133 (nom, fonctions, e-mail, téléphone avec le logo à sa droite) puis visuel 224 × 140, empilés. Réglage par défaut 140 % (328 × 403 px), qui tient dans la zone de lecture de tous les téléphones ; 100 %, 125 % et 150 % sont disponibles (étape 9).

**Mécanisme, sans aucun bloc de style.** Les éditeurs de signature (Outlook Mac, Apple Mail, Gmail) suppriment les blocs `<style>` au collage : une media query ne survit donc pas au client d'envoi. La bascule repose uniquement sur des styles inline lus par tous les moteurs web : chaque version est placée dans un conteneur dont la largeur et la hauteur valent `calc((100vw - 539px) * 1000)` pour le desktop et `calc((540px - 100vw) * 1000)` pour le mobile, bornées par `min-width/min-height:0` et `max-width/max-height` égaux à la taille exacte du bloc, avec `overflow:hidden`. Sur un écran de moins de 540 px de large (`vw` = largeur d'écran), le conteneur desktop mesure 0 × 0 et le conteneur mobile sa taille pleine ; au-dessus, l'inverse.

| Destinataire | Rendu |
|---|---|
| Apple Mail iOS, Gmail iOS/Android (compte Google), Outlook iOS/Android | Plan 02 |
| Apple Mail macOS, Gmail web, Outlook Mac, Outlook.com, nouveau Outlook, iPad | Desktop 500 × 150 |
| Outlook classique Windows (Word ignore `calc`, `vw`, `max-*`, `overflow`) | Desktop ; le bloc mobile est masqué par `mso-hide:all` |
| Application Gmail avec un compte non Google (IMAP) | `calc()` non lu : les deux versions s'affichent l'une sous l'autre. Seul cas connu. |

Sans la version mobile (case décochée), le code redevient le seul tableau desktop, avec des largeurs minimales qui empêchent Gmail mobile d'écraser les colonnes.

L'aperçu du générateur propose deux vues : desktop et téléphone (plan 02). Pour un visuel personnalisé, le générateur produit les deux recadrages (855 × 420 et 672 × 420, suffixe `-mobile`).

## Taille d'affichage

Par défaut la signature fait 500 × 150 px, la taille du fichier source. L'étape 7 du générateur propose 125 % (624 × 187), 150 % (752 × 226) et 200 % (1000 × 300) : toutes les dimensions du code exporté sont recalculées (largeurs de cellules, images, marges, corps de texte, interlettrage). La « Loupe ×2 » de l'aperçu ne fait qu'agrandir l'affichage dans le générateur, pour contrôler la netteté, et n'a aucun effet sur la signature copiée. Au-delà de 150 %, le visuel fourni en ×3 perd un peu de netteté sur écran Retina.

## Mise en service (une fois, par l'IT ou le marketing)

1. **Hébergement en place** : le dossier est publié sur GitHub Pages à `https://hadr1enhouyez.github.io/leko-signature/` (dépôt `Hadr1enHouyez/leko-signature`, miroir du code dans `LekoLabs/leko-signature`, dont l'organisation interdit les Pages). Le générateur en ligne : `https://hadr1enhouyez.github.io/leko-signature/generateur.html`. L'URL des images est pré-remplie à l'étape 5. Ne jamais renommer ni déplacer ces fichiers : chaque e-mail déjà envoyé y fait référence. Pour changer d'hébergement plus tard (lekolabs.com, organisation GitHub), toutes les signatures devront être recopiées.
2. Pour mettre à jour : modifier les fichiers, `git push` sur `main`, GitHub Pages redéploie en une à deux minutes.
3. Communiquer le dossier (OneDrive) aux collaborateurs : chacun ouvre `generateur.html`, remplit ses champs, clique **Copier la signature** et colle dans son client mail (procédures détaillées en bas du générateur).

> Sans hébergement, le générateur intègre les images en base64 : suffisant pour un test dans Apple Mail ou Outlook Mac, mais **Gmail et Outlook Windows n'afficheront pas les images**.

## Transmettre une signature à un collègue

- **Lien pré-rempli** : bouton « Copier un lien pré-rempli » sous l'aperçu. Le lien ouvre le générateur avec les champs déjà renseignés (`?name=…&title1=…&email=…&theme=…&scale=…`). Le collègue n'a plus qu'à cliquer « Copier la signature ». Un lien copié depuis un fichier local pointe vers le chemin de cet ordinateur ; pour un lien valable pour tous, héberger `generateur.html` dans le même dossier en ligne que les images et l'ouvrir depuis là.
- **Fichier prêt à coller** : remplir ses champs puis « Télécharger signature.htm ». Sur Mac ou Gmail, ouvrir le fichier dans un navigateur, tout sélectionner, copier, coller dans les réglages de signature. Sur Outlook classique Windows, renommer le fichier `LEKO.htm` et le déposer dans `%APPDATA%\Microsoft\Signatures`, Outlook fermé.

## Visuel personnalisé (campagne, projet, recrutement…)

Étape 4 › « Mon propre visuel » : charger une photo (idéalement ≥ 1710 × 840 px), régler le recadrage, télécharger le PNG produit (855 × 420, angles 15 px, CTA et ombre ajoutés), le déposer dans le dossier hébergé sous le nom indiqué. Le code exporté pointe déjà vers ce fichier. Pour un visuel de campagne commun, le déposer une fois et donner son URL à chacun (« Un visuel déjà préparé en ligne »).

## Limites connues

- **Images bloquées** (expéditeur inconnu) : le destinataire voit la cellule avec le texte mais sans angles, logo ni visuel, jusqu'à ce qu'il autorise les images.
- **Poids** : le visuel PNG par défaut pèse 580 Ko. Hébergé, il n'alourdit pas les e-mails. En cas de collage sans hébergement dans Apple Mail ou Outlook Mac, il est joint à chaque message : préférer alors l'hébergement ou la variante JPG.
- **Neue Haas Grotesk** n'est jamais chargée en webfont dans un e-mail : les destinataires sans la police voient Helvetica/Arial.

## Régénérer les assets depuis Illustrator

Le fichier `.ai` est compatible PDF (PyMuPDF). Zones utilisées (coordonnées du plan de travail 01, en pt = px ×2) : tuile noire `[10,10]–[410,290]` découpée en `y 10–26` (haut) et `y 226–290` (bas + logo), rendues à ×2 de la source (= ×4 affichage) avec fond transparent ; les variantes blanches sont l'inversion RVB des noires, alpha conservé. Visuel : recadrage exact de la photo source 6000 × 3795 correspondant à la fenêtre `[419.9,10.1]–[990,290]`, Lanczos vers 855 × 420, masque arrondi 22,5 px. CTA + ombre : rendu de la zone `[900,200]–[994,294]` après suppression de la photo, à ×1,5 de la source, composé en (720, 285).
