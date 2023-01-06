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
	
- echo pour écrire une chaîne de caractère en sortie :
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ grep "Location" 2016*.ann | wc -l >> sortie.txt
	
- file pour vérifier l'encodage du fichier :
	
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ file sortie.txt
	sortie.txt: Unicode text, UTF-8 text
	yidi@huang-Lenovo-XiaoXinAir-14-ACN-2021:~/下载/projet_encadre/Fichiers$ file sortie2.txt
	sortie2.txt: ASCII text
	
- hexdump : pour voir les codes héxadécimaux du fichier encodé en codes binaires

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
	

	

