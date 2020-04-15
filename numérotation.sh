#! /bin/bash

# Vérification de la syntaxe
if [ $# -ne 1 ]
then
	echo "SYNTAXE : $0 nom_fichier"
	exit 1
fi

# Vérification que le fichier demandé à l'ouverture est valide
if [ ! -f $1 ]
then
	echo "ERREUR : $1 n'existe pas"
	exit 2
fi

# Création du nouveau fichier et initialisation
nouveaufichier="$1".num
echo $nouveaufichier
> $nouveaufichier

# Gestion de l'erreur de création de fichier
if [ $? -ne 0 ]
then
	echo "ERREUR : $nouveaufichier ne peut pas être créé"
	exit 3
fi

#Boucle de lecture/écriture
compteur=0
IFS=$'\n'	# Permet d'employer \n comme séparateur de lecture au lieu d'espace
for ligne in `cat $1`
do
	echo $ligne
	echo $compteur". "$ligne >> $nouveaufichier
	((compteur++))
done

# Fin normale du programme
exit 0
