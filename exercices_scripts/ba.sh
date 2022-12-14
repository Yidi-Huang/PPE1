#!usr/bin/env bash

if[ [$# -ne 2 ]]
then
	echo "deux arguments attendus : <dossier> <langue>"
	exit
fi

folder=$1  # dump-txt OU cpmtextes
basename=$2  # en, fr, etc ...

echo "lang=\"$basename\">"

for filepath in $(ls $folder/$basename-*.txt)
do
	
	
	#filepath == dumps-texts/fr-1.txt
	# ==> pagename = fr-1
	pagename=$(basename -s .txt $filepath)
	echo "<page=\"$pagename\">"
	echo "<text>"

	# on recupere les dumps
	# et on ecrit a l'interieur de la balise text
	content=$(cat $filepath)
	
	#ordre important : & en premier
	# sinon : < => &lt; => amp;lt;
	content=$(echo "$content" sed 's/&/&amp;/g')   #s : subsituer   g:globalement
	content=$(echo "$content" sed 's/</&lt;/g')    # creer un espace ?
	content=$(echo "$content" sed 's/>/&gt;/g')
	
	echo "$content"
	
	echo "</text>"
	echo "</pahe> "

done



echo "</lang>"
