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
