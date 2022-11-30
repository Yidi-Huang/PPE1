fichier_urls=$1

lignenum=1;
fich=$(basename -s .txt $fichier_urls)
while read URL;
do
	curl -o fich-$lignenum.html $URL
	cd /home/yidi/下载/projet_encadre/PPE1/exercices_scripts/dump-text
	w3m $URL > fich-$lignenum.txt
	lignenum=$((lignenum+1))
done < $fichier_urls
