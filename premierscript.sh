cd /home/yidi/下载/projet_encadre/Fichiers

echo "pour l'annee 2016:" > sortie3.txt
grep "Location" 2016*.ann | wc -l >> sortie3.txt
