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
    echo : écrire une chaîne de caractère en sortie
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


## séance 3 -
###
