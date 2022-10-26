#!/bin/bash

N=0
for ele in $( seq 1 4 50)
do
	N=$( expr $N + 1 )
	echo "Le $N ieme element est $ele"
done
