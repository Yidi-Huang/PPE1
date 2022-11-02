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
