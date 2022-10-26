cd '/home/yidi/下载/projet_encadre/Fichiers' 
echo "Pour l'annee 2016:" > sortie.txt
grep "Location" 2016*.ann | wc -l >> sortie.txt
