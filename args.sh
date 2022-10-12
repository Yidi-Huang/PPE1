#! /usr/bin/bash
cd '/home/yidi/下载/projet_encadre/Fichiers' 
ANNEE=$1
TYPE=$2

echo "Pour l'annee $ANNEE" > sortie1.txt
grep "$TYPE" $ANNEE*.ann | wc -l >> sortie1.txt
