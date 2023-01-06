# Journal de bord du projet encadré

## séance 1 - base de commande
### 21 septembre 2022 
La première séance est dédiée à l'introduction du fichier. Les concepts commes les chemins absolus et les chemins relatives vers les fichiers nous permetttent de retrouver les fichiers depuis un endroit de l'arborescence.

Le chemin absolu indique la position d'un fichier depuis la racine, alors le chemin relatif part depuis le dossier courant.

Nous avons également essayé certains caractères qui seront utilisés dans les commandes pour manipuler les fichiers. Par exemple, ? et * sont utiles pour remplacer les caractères.

Nous avons procédé à utiliser certaines commandes. Les commandes sont utilisées sous forme de nom [-option] [argument]. Différentes commandes sont testées : 

    cd : se déplacer dans un autre répertoire
    pwd : voir le répertoire courant
    cat : afficher tout le fichier en sortie
    less : voir ce que contient le fichier
    head : affiche début du fichier en sortie
    tail : affiche fin du fichier en sortie
    mkdir : crée un repertoire
    rmdir : supprimer une répertoire
    touche : crée un fichier 
    rm : supprimer un fichier

Les commandes ont une option --help, qui peut nous aider à comprendre les fonctionnements différents des options de cette commande.

## séance 2 - Github
### 28 septembre 2022
Après la 2e séance, nous avons une connaissance de base sur Github, qui sera le plateforme pour partager et présenter notre projet.

Lors de l'apprentissage des flux d'entrées-sorties, nous avons appris que les pipes | sont capables de séparer plusieurs commandes et ainsi sont redirigés les résultats de sorties.

- La commande grep nous permet de rechercher le contenu dont nous avons rempli dans l'argument dans des fichiers.
- La commande sort peut tirer des lignes dans les fichiers.
- La commande uniq aide à supprimer les doublons (les lignes).

Il arrive souvent que sort | uniq soient utilisés en même temps afin d'avoir un fichier sans répétitions de lignes.

Nous avons essayé les commandes et les caractères spéciaux pour traiter les fichiers.

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ wc  2016*.ann
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ wc  2017*.ann
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ wc  2018*.ann

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ egrep "Location" 2016*.ann | wc -l
	3144

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ egrep "Location" 20*.ann > new


## séance 3 - script
### 5 octobre 2022
Nous avons tout d'aobrd créer le ssh key pour le Github.

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~$ ssh-keygen -t ed25519 -C Yidi-Huang@github.com
	Generating public/private ed25519 key pair.
	Enter file in which to save the key (/home/yidi/.ssh/id_ed25519): 
	Created directory '/home/yidi/.ssh'.
	Enter passphrase (empty for no passphrase): 
	Enter same passphrase again: 
	Your identification has been saved in /home/yidi/.ssh/id_ed25519
	Your public key has been saved in /home/yidi/.ssh/id_ed25519.pub
	The key fingerprint is:
	SHA256:2TgTWMoJMBqyN2We3VpwdQ7WhqD+KLyWLiKQ1i89PL8 Yidi-Huang@github.com

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/PPE1$ git tag TestTag1 -a -m "Mon premier tag"
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/PPE1$ git tag -l
	TestTag1
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/PPE1$ git push origin TestTag1

Exercice 1 : rechercher les contenus des fichiers de l'année 2016

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ sort 2016*.ann | wc -l
	9442

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ sort 2016*.ann| head
	T100	Location 2116 2134	République tchèque
	T101	Location 2137 2144	Croatie
	T102	Hour 2148 2151	18h
	T103	Location 2154 2167	Saint-Étienne
	T104	Location 2180 2187	Espagne
	T105	Location 2190 2197	Turquie
	T106	Hour 2201 2204	21h
	T107	Location 2207 2211	Nice
	T108	Location 2225 2233	Belgique
	T109	Location 2236 2243	Irlande

Puis, nous avons procédé au script.

Les caractères > et >> nous permet de rediriger la sortie. Le premier peut créer un nouveau fichier ou écraser les contenus précédents. Le dernier est pour ajouter des contenus à la fin du fichier.

De plus, pour rendre le script lisible, il vaut mieux :
- ajouter des commentaires #
- ajouter un shebang #!/usr/bin/bash
- rendre le fichier exécutable (avec chmod +x)

Nous avons écrit les scripts dans le Notepadqq.

Exercice 2 : écrire un script qui donne le nombre de Location par année

	cd '/home/yidi/下载/projet_encadre/Fichiers' 
	echo "Pour l'annee 2016:" > sortie.txt
	grep "Location" 2016*.ann | wc -l >> sortie.txt

## séance 4 - arguments du script
### 12 octobre 2022

Au cours de la 4e séance, nous avons pratiqué certaines commandes pour avoir une vue plus claire sur les fichiers.

- wc -l nous permet de compter les lignes des fichiers :

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ grep "" 2016*.ann | wc -l
	9442
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ grep -E '.?' 2018*.ann | wc -l
	7561
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ grep -E 'Location' 2018*.ann | wc -l
	3110
	
echo pour écrire une chaîne de caractère en sortie :
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ grep "Location" 2016*.ann | wc -l >> sortie.txt
	
file pour vérifier l'encodage du fichier :
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ file sortie.txt
	sortie.txt: Unicode text, UTF-8 text
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ file sortie2.txt
	sortie2.txt: ASCII text
	
hexdump : pour voir les codes héxadécimaux du fichier encodé en codes binaires

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ hexdump sortie2.txt
	0000000 6f42 6a6e 756f 0a72                    
	0000008

En plus, nous avons comme objectif d'écrire des scripts qui contiennent des arguments.

Les arguments nous permettent de :
- éviter les répétitions dans le script
- traiter différentes données sans changement de structure du script

Par convention, les valeurs des arguments sont interprétées par les variables $nom.

On donne une valeur à une variable avec le signe =, et on peut aussi stocker le resultat d’une commande en l’écrivant dans $()

Exercice 1 : modifier le premier script pour que l’année et le type d’entité soient donnés en argument du programme

	#! /usr/bin/bash
	cd '/home/yidi/下载/projet_encadre/Fichiers' 
	ANNEE=$1
	TYPE=$2

	echo "Pour l'annee $ANNEE" > sortie1.txt
	grep "$TYPE" $ANNEE*.ann | wc -l >> sortie1.txt
	

## séance 5 - instructions conditionnelles et html
### 19 octobre 2022
Lors de la 5e séance, les professeurs nous ont présenté les instructions conditionnelles, afin d'effectuer des traitements lorsque les conditions sont respectées.

Premièrement, l'instruction if nous permet de vérifier une condition, et traite l'entrée différemment selon les arguments.

Durant ce processus, il y a des expressions pour les conditions :

- -f fichier vrai si le fichier existe
- -d dossier vrai si le dossier existe
- -s fichier vrai si le fichier existe et n’est pas vide

- = et != pour égale et différent
- < ou > pour déterminer si in chaîne est avant ou après une autre dans l’ordre alphabétique
- -n chaine vrai si la chaîne n’est pas vide
- -z vrai si la chaîne est vide

En plus, il y a également des conditions sur les entiers :
- a -eq b si a est égal à b (equal)
- a -ne b si a est différent de b (not equal)
- a -lt b si a est plus petit que b (less than)
- a -gt b si a est plus grand que b (greater than)
- a -le b si a est inférieur ou égal à b
- a -ge b si a supérieur ou égal à b

Pour que chaque fois le script tourne, il veut mieux ajouter des lignes de validation des arguments.

Deuxièmement, les instructions for et while nous permet de faire des boucles sans répéter le code. Ces boucles appliquent toujours les mêmes traitements dans différentes données.
En outre, la commande read s'accompagne souvent de WHILE pour traiter des fichiers existés.
Il faut toujours faire attention lors de l'utilisation de FOR et WHILE aux boucles infinies.

Exercice 1 : vérifier les arguments

	#/bin/bash

	if [ -z $1 ]
	then
		echo "argument 1 est manquant"
	fi
	echo "fin du programme"

Exercice 2 : chercher le Nième élément dans la séquence

	#!/bin/bash

	N=0
	for ele in $( seq 1 4 50)
	do
		N=$( expr $N + 1 )
		echo "Le $N ieme element est $ele"
	done
	
Exercice 3 : lire les lignes une après l'autre

	N=0
	while read LINE
	do
		N=$(expr $N + 1)
		echo "$N je lis $LINE"
	done
	echo "fin"
	
	
En plus de l'écriture du script, nous avons aussi commencé la partie du html. Ce dernier est un langage de balisage pourreprésenter des pages web.

Les balises marquent le début et la fin de chaque zone contenant des contenus avec une certaine structure.

Les ouvrantes et les fermantes de balises peuvent être considérées comme l'ancre d'une zone.

Les commandes curl et lynx sont utiles pour récupérer les inforamtions d'un html.

Avec la commande curl :

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~$ curl www.perdu.com | grep -i perdu
	% Total	% Received % Xferd  Average Speed   Time	Time 	Time  Current
									Dload  Upload   Total   Spent	Left  Speed
	100   204  100   204	0 	0	328  	0 --:--:-- --:--:-- --:--:--   329
	<html><head><title>Vous Etes Perdu ?</title></head><body><h1>Perdu sur l'Internet ?</h1><h2>Pas de panique, on va vous aider</h2><strong><pre>	* <----- vous &ecirc;tes ici</pre></strong></body></html>


## séance 6 - URL
### 26 octobre 2022

La 6e séance a pour sujet les commandes lynx et curl, qui sert à récupérer des informations des htmls.

Avec la commande lynx :

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~$ lynx -dump -nolist "https://www.wikipedia.org/"

	dump : texte de sortie standard (soit l'écran, l'affichage)
	list : retirer le texte du dump

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre$ 	lynx -dump -nolist fr.wikipedia.org/wiki/Robot > Robot.txt

Avec la commande curl : 

-i : va donner des informations sur l’interaction avec le serveur
-I : va donner seulement l'entête des informations (plus clair et utile)

	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre$ curl -i www.perdu.com
	HTTP/1.1 200 OK
	Date: Wed, 26 Oct 2022 08:58:28 GMT
	Server: Apache
	Upgrade: h2
	Connection: Upgrade
	Last-Modified: Thu, 02 Jun 2016 06:01:08 GMT
	ETag: "cc-5344555136fe9"
	Accept-Ranges: bytes
	Content-Length: 204
	Cache-Control: max-age=600
	Expires: Wed, 26 Oct 2022 09:08:28 GMT
	Vary: Accept-Encoding,User-Agent
	Content-Type: text/html

	<html><head><title>Vous Etes Perdu ?</title></head><body><h1>Perdu sur l'Internet ?</h1><h2>Pas de panique, on va vous aider</h2><strong><pre>    * <----- vous &ecirc;tes ici</pre></strong></body></html>

Ce résultat nous indique beaucoup de choses : 

1. HTTP 200 indique que le URL est accessible et fonctionne bien. Pour notre projet, on peut vérifier les 50 URLs par cette indice.

2. Content-Type raconte l'encodage du html original. Normalement, UTF-8 est préféré, car le html qu'on va créer doit en encodage UTF-8.
	
Nous avons commencé en même temps la recherche des 50 URL sur notre mot choisi.
Pendant ce processus, il est à noter qu'il faut avoir un retour à la ligne à la fin du fichier, sinon avec les commandes -r, la dernière ligne ne sera pas prise en compte par la machine.

Exercice du cours précédent : 

1 classement des lieux les plus cites

• par $ANNEE et $MOIS en limitant à $TOPN résultats plus nombreux

• en validant les arguments

	#! /usr/bin/bash
	cd '/home/yidi/下载/projet_encadre/Fichiers' 

	if [  $# -ne 2  ] 
	then
		echo "manque d'argument"
		exit
	fi

	ANNEE=$1
	MOIS=$2

	if [ -f  2016_01_01-001.txt  ]
	then
		echo "Pour l'annee $ANNEE et le mois $MOIS" > resultat2.txt
		grep "Location" $ANNEE"_"$MOIS*.ann | wc -l | sort | uniq -c  >> resultat2.txt
	else
		echo "pas d'informations demandees"
	fi
	
2 Compter $TYPE d’entités par $ANNEE

• basique

• avec arguments

• en validant les arguments avec des et exit si problème.

	#! /usr/bin/bash
	cd '/home/yidi/下载/projet_encadre/Fichiers' 

	if [ $# -ne 1  ] 
	then
		echo "manque d'argument"
		exit
	fi

	ANNEE=$1
	TYPE=$2

	if [ -f  2016_01_01-001.txt  ]
	then
		echo "Pour l'annee $ANNEE" > resultat1.txt
		grep "$TYPE" $ANNEE*.ann | wc -l >> resultat1.txt
	else
		echo "pas d'informations sur annees"
	fi

## séance 7 - HTML
### 9 novembre 2022
Pendant la 6e séance, nous avons réalisé des préparations pour le HTML du projet.

Tout d'abord, c'était la création d'un nouveau répertoire Github pour le projet. Nous avons créer une page site web à l'aide de Github, et cette page sera la page d'accueil pour le projet.

Puis, nous avons procédé à la validation et construction du corpus depuis les URL.

Pour vérifier si la ligne est un URL, il y a deux méthodes :

1 vérifier si le début de la ligne commence par http(s):
	
	# !/ usr / bin / bash
	if [ $ # - ne 1 ]
	then
		echo " ce programme demande un argument "
			exit
	fi
	FICHIER_URLS = $1
	OK =0
	NOK =0
	while read -r LINE ;
	do
		echo " la ligne : $LINE "
		if [[ $LINE =∼ " ^ https ?:// " ]]
		then
			echo " ressemble à une URL valide "
			OK = $ ( expr $OK + 1)
		else
			echo " ne ressemble pas à une URL valide "
			NOK = $ ( expr $NOK + 1)
		fi
	done < $FICHIER_URLS
	echo " $OK URLs et $NOK lignes douteuses "
	
2 nous pouvons vérifier de manière plus prudente à l'aide de la commande -curl, qui sert à entrer dans la page html du lien et à récupérer des informations du html

	FICHIER=$1
	URLS=$(cat  $FICHIER)

	for URL in $URLS
	do 
		LINE=$(curl -I $URL)
		if [[  $LINE =~ "HTTP"  ]]
		then
			echo "URL"
		else
			echo "Non URL"
		fi
	done

En plus de savoir si les lignes sont des URL, il est obligatoire, pour le projet de récupérer les contenus depuis les URL et les stocker à local.

La première tâche consiste à créer un tableau qui contiennent toutes les informations de chaque URL. La base commence par le numéro de URL, le URL, et son encodage.

Avec le script que les professeurs nous ont donnés, le html contient les trois éléments que nous mentionnons ci-dessus.

	fichier_urls=$1 # le fichier d'URL en entrée
	fichier_tableau=$2 # le fichier HTML en sortie

	if [[ $# -ne 2 ]]
	then
		echo "Ce programme demande exactement deux arguments."
		exit
	fi

	mot="exile" # à modifier

	echo $fichier_urls;
	basename=$(basename -s .txt $fichier_urls)

	echo "<html><body>" > $fichier_tableau
	echo "<h2>Tableau $basename :</h2>" >> $fichier_tableau
	echo "<br/>" >> $fichier_tableau
	echo "<table>" >> $fichier_tableau
	echo "<tr><th>ligne</th><th>code</th><th>URL</th><th>encodage</th></tr>" >> $fichier_tableau

	lineno=1;
	while read -r URL; do
		echo -e "\tURL : $URL";
		# la façon attendue, sans l'option -w de cURL
		code=$(curl -ILs $URL | grep -e "^HTTP/" | grep -Eo "[0-9]{3}" | tail -n 1)     
		## -s : mode silencieux : éviter afficher tout pas nécessaire   -o : uniquement ce qui est reconnu  cut -d " " -f2 = grep -Eo "[0-9]{3}"
		## tail -n 1 : on prend la dernière ligne
		charset=$(curl -ILs $URL | grep -Eo "charset=(\w|-)+" | cut -d= -f2)
		## \w : lettre ou chiffre, pour avoir une séquence de lettres, chiffres et tiret
		## cut -d= f2 : separer par "="             -d= : délimiteur est "=", pour découper les colones    -f2 : la dexième colone, morceau découpé par "d"
		# autre façon, avec l'option -w de cURL
		# code=$(curl -Ls -o /dev/null -w "%{http_code}" $URL)       -w
		# charset=$(curl -ILs -o /dev/null -w "%{content_type}" $URL | grep -Eo "charset=(\w|-)+" | cut -d= -f2)

		echo -e "\tcode : $code";

		if [[ ! $charset ]]
		then
			echo -e "\tencodage non détecté, on prendra UTF-8 par défaut.";
			charset="UTF-8";
		else
			echo -e "\tencodage : $charset";
		fi
		
Dans ce script, les commandes vont chercher l'entête des URL, et l'encodage peut ainsi détecté et affiché. S'il n'y a pas d'encodage détecté dans l'entête, affiché après l'indice "charset", l'encodage est pris par défaut UTF-8.


## séance 8 - Construction du corpus
### 16 novembre 2022

À part du tableau de base, il faut également récupérer les contenus depuis les URL. Lors de la séance 8, nous nous sommes attachés à construire les dumps et les aspirations des URL.

Les dumps sont séparé en deux parties : un pour dump-html, aussi dénommé comme aspiration, qui nous envoie au format html de URL ; l'autre pour le dump-text qui ne réunit que les textes de URL original. Ce dernier sera essentiel pour l'analyse du mot dans le contexte (corpus). Le nombre d'apparition du mot dans le dump-text, la position du mot (titre, au bout ou à la fin du contexte) ... Tout cela consitue l'analyse de base du mot.

Pour que les dossiers peuvent être traités d'une seule fois, nous pouvons ajouter les commandes dans le script original :

	aspiration=$(curl $URL>aspirations/$basename-$lineno.html)
	
	if [[ $code -eq 200 ]]
	then
		dump=$(lynx -dump -nolist -assume_charset=$charset -display_charset=$charset $URL)
		## -dump : le texte de toutes les balises HTML          -nolist : ne pas avoir une liste a la fin
		if [[ $charset -ne "UTF-8" && -n "$dump" ]]     ## -n "$dump" : assurer c'est pas vide
		then
			dump=$(echo $dump | iconv -f $charset -t UTF-8//IGNORE)
		fi
	else
		echo -e "\tcode différent de 200 utilisation d'un dump vide"
		dump=""
		charset=""
	fi
	echo "$dump" > "dump-text/$basename-$lineno.txt"
	echo "<tr><td>$lineno</td><td>$code</td><td><a href=\"$URL\">$URL</a></td><td>$charset</td></tr>" >> $fichier_tableau
	echo -e "\t--------------------------------"
	lineno=$((lineno+1));
	done < $fichier_urls
	echo "</table>" >> $fichier_tableau
	echo "</body></html>" >> $fichier_tableau
	
L'ajout du script produit le dump et aspiration des URL, et ces deux parties peuvent être arrangées dans le html comme deux nouvelles colonnes du tableau.
À partir du tableau de base comme ci-dessous, on peut ajouter des indices dans la 7e ligne :

	<html>
		<header>
			<meta charset="UTF-8" />
		</header>
		<body>
			<table>
			<tr><th>ligne</th><th>code</th><th>URL</th><th>aspiration</th><th>dump-text</th></tr>
			<tr><td>1</td><td>200</td><td>www.perdu.com</td></tr>
			</table>
		</body>
	</html>


## séance 9,10 - concordance et contexte
### 23, 30 novembre 2022
La séance 9 a pour objectif de compléter la construction du tableau avec les concordances et les contextes du mot dans les URL.

Le contexte consiste à représenter les phrases ou les syntagmes avant et après le mot du projet. ALors pour la concordance, elle nous montre le nombre d'apparence du mot dans une page de URL. Ce nombre peut être considéré comme un repère pour vérifier si le contexte est pertinent ou pas.

Pour réaliser ces deux fonctions, nous sommes obligés à ajouter des commandes dans le script original.

	  grep -E -A2 -B2 $mot ./dumps-text/$basename-$lineno.txt > ./contextes/$basename-$lineno.txt
	  
	  bash programmes/concordance.sh ./dumps-text/$basename-$lineno.txt $mot > ./concordances/$basename-$lineno.html
	  
	  echo "<tr><td>$lineno</td><td>$code</td><td><a href=\"$URL\">$URL</a></td><td>$charset</td><td><a href="../aspirations/$basename-$lineno.html">html</a></td><td><a href="../dumps-text/$basename-$lineno.txt">text</a></td><td>$NB_OCC</td><td><a href="../contextes/$basename-$lineno.txt">contextes</a></td><td><a href="../concordances/$basename-$lineno.html">concordance</a></td></tr>" >> $fichier_tableau
	echo -e "\t--------------------------------"
	lineno=$((lineno+1));
	done < $fichier_urls
	echo "</table>" >> $fichier_tableau
	echo "</body></html>" >> $fichier_tableau

Les deux premières lignes du script peut traiter respectivement les dumps-text des URL pour tirer les contextes du mot et compter le nombre d'apparition du mot dans les pages web.

La dernière partie est construite afin d'obtenir un html, qui a pour contenu un tableau avec toutes les colonnes d'informations nécesaires : numéro, URL, encodage, aspiration, dump-text, contexte et concordance.

Avec ce script complète, nous pouvons finalement obtenir un tableau dans html comme ci-dessous :
	<html><body>
	<h2>Tableau URL_anglais :</h2>
	<br/>
	<table>
	<tr><th>ligne</th><th>code</th><th>URL</th><th>encodage</th><th>dump html</th><th>dump text</th><th>occurrences</th><th>contextes</th><th>concordances</th></tr>
	<tr><td>1</td><td>200</td><td><a href="https://en.wikipedia.org/wiki/Exile">https://en.wikipedia.org/wiki/Exile</a></td><td>UTF-8</td><td><a href=../aspirations/URL_anglais-1.html>html</a></td><td><a href=../dumps-text/URL_anglais-1.txt>text</a></td><td>80</td><td><a href=../contextes/URL_anglais-1.txt>contextes</a></td><td><a href=../concordances/URL_anglais-1.html>concordance</a></td></tr>
	<tr><td>2</td><td>200</td><td><a href="https://www.omct.org/en/resources/news/afghanistan-pour-freshta-lexil-comme-seul-moyen-de-rester-en-vie">https://www.omct.org/en/resources/news/afghanistan-pour-freshta-lexil-comme-seul-moyen-de-rester-en-vie</a></td><td>UTF-8</td><td><a href=../aspirations/URL_anglais-2.html>html</a></td><td><a href=../dumps-text/URL_anglais-2.txt>text</a></td><td>2</td><td><a href=../contextes/URL_anglais-2.txt>contextes</a></td><td><a href=../concordances/URL_anglais-2.html>concordance</a></td></tr>
	<tr><td>3</td><td>200</td><td><a href="https://www.theguardian.com/world/2022/jun/08/moscows-chief-rabbi-in-exile-after-resisting-kremlin-pressure-over-war">https://www.theguardian.com/world/2022/jun/08/moscows-chief-rabbi-in-exile-after-resisting-kremlin-pressure-over-war</a></td><td>UTF-8</td><td><a href=../aspirations/URL_anglais-3.html>html</a></td><td><a href=../dumps-text/URL_anglais-3.txt>text</a></td><td>5</td><td><a href=../contextes/URL_anglais-3.txt>contextes</a></td><td><a href=../concordances/URL_anglais-3.html>concordance</a></td></tr>
	<tr><td>4</td><td>200</td><td><a href="https://www.theguardian.com/global-development/2022/aug/25/afghan-women-exile-taliban-global-policy">https://www.theguardian.com/global-development/2022/aug/25/afghan-women-exile-taliban-global-policy</a></td><td>UTF-8</td><td><a href=../aspirations/URL_anglais-4.html>html</a></td><td><a href=../dumps-text/URL_anglais-4.txt>text</a></td><td>3</td><td><a href=../contextes/URL_anglais-4.txt>contextes</a></td><td><a href=../concordances/URL_anglais-4.html>concordance</a></td></tr>
	...

## séance 11 - Itrameur
### 7 décembre 2022

La 11e séance est dédiée à la fonction d'un outil Itrameur, qui peut analyser le mot, le corpus ainsi que le lien entre les deux éléments.

À l'aide de cet outil, on peut vérifier le dictionnaire du corpus, soit les mots et leur nombre d'apparition à l'ordre décroissant. 

En plus, Itrameur peut nous aider notamment à étudier le contexte du mot. Par rapport au script que nous avons utilisé pour le contexte, Itrameur nous donne respectivement un mot avant et après le mot clé. Cette relation peut être représenté sous forme d'un tableau, qui peut clairement analyser les mots les plus fréquents autour du mot clé. Mais elle peut aussi être présentée sous forme d'une graphe, qui est plus lisible pour l'analyse.

Itrameur nous permet aussi de voir la fréquence du mot clé dans les corpus réunis.

Pour obtenir un fichier qui peut être traité par Itrameur, il faut tout d'abord créer un nouveau fichier qui peut être reconnu par Itrameur à partir du dump-text ou contexte.

Avec le script ci-dessous, nous avons réussi à produire les deux fichier de base pour Itrameur.

	if [[ $# -ne 2 ]]
	then
		echo "Deux arguments attendus: <dossier> <langue>"
		exit
	fi

	folder=$1 # dumps-text OU contextes
	basename=$2 # en, fr, ru, pl, it, jp, etc...

	echo "<lang=\"$basename\">" > "./itrameur/$folder-$basename.txt"

	for filepath in $(ls $folder/$basename-*.txt)
	do
		# filepath == dumps-texts/fr-1.txt
		# 	==> pagename = fr-1
		pagename=$(basename -s .txt $filepath)

		echo "<page=\"$pagename\">" >> "./itrameur/$folder-$basename.txt"
		echo "<text>" >> "./itrameur/$folder-$basename.txt"
	
		# on récupère les dumps/contextes
		# et on écrit à l'intérieur de la balise text
		content=$(cat $filepath)
		# ordre important : & en premier
		# sinon : < => &lt; => &amp;lt;
		content=$(echo "$content" | sed 's/&/&amp;/g')
		content=$(echo "$content" | sed 's/</&lt;/g')
		content=$(echo "$content" | sed 's/>/&gt;/g')

		echo "$content" >> "./itrameur/$folder-$basename.txt"

		echo "</text>" >> "./itrameur/$folder-$basename.txt"
		echo "</page> §" >> "./itrameur/$folder-$basename.txt"
	done

	echo "</lang>" >> "./itrameur/$folder-$basename.txt"


## séance 12 - Wordcloud
### 14 décembre 2022
	


	

