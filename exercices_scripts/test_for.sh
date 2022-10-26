N=0
for ele in $(ls)
do 
	echo "voici le contenu de $ele"
	cat $ele
done
