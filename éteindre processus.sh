#! /bin/bash

if [ $# -ne 1 ]
then
	echo "SYNTAXE : $0 processus"
	exit 1
else
	process=`ps -ly | grep " $1$" | cut -d' ' -f5`
	if [ -z "$process" ]
	then
		echo "ERREUR : $1 non trouvé."
		exit 2
	else
		echo "Trouvé : $process"
		kill -9 $process
		exit 0
	fi
fi
