 
function creationArchive
{
	echo "Quel nom voulez-vous utiliser pour archive : "
	read archive
	echo "Quel fichiers voulez-vous archiver : " 
	cd archive
	mkdir -p "$(date +"%d-%m-%Y")"
	ls
	read fichier
	tar -cvf "${archive}".tar $fichier
	ln -s $(pwd)/"${archive}".tar  /mnt/cloud/
	ln -s $(pwd)/$fichier  /mnt/cloud/
	echo "Votre archive $archive a bien été créée"
	

}

function ajouteFichiers
{
	echo "Quel nom de l'archive que vous voulez utiliser : "
	cd archive
	ls	
	read archive
	echo "Saisir le nombre de fichiers que vous voulez mettre dans l'archive : "	
	read nbr
	if [ nbr != 0 ]
	then
        for (( var=1; var<=nbr; var++ ))
		do
		echo "Saisir le nom des fichiers : (donner seulement 1 fichier à la ligne de commande)" 
	    	read fichier
	    	tar -rf $archive $fichier 
		ln -s $(pwd)/$fichier  /mnt/cloud/
		done
	fi
	echo "Vos fichiers ont bien été ajouté."
	 

}

function listeArchive
{
	echo "Quel archive que vous voulez lister : "
	cd archive
	ls	
	read archive
	echo "Voici les fichiers à l'intérieur de l'archive $archive : "
	tar -tf $archive
	

}

function extraireArchive
{
	echo "Quel archive que vous voulez extraire  : "
	cd archive
	ls
	read archive
	echo "Ou voulez-vous extraire les fichiers : "	
	read rep	
	tar -xvf $archive.tar -C /home/debian/$rep


}

function menu {
	clear
	echo
	echo -e "\t\t\t Menu\n"
	echo -e "\t1. Creer une nouvelle archive "
	echo -e "\t2. Ajouter des fichiers dans une archive  "
	echo -e "\t3. Lister le contenu d'une archive        "
	echo -e "\t4. Extraire le contenu d'une archive      "
	echo -e "\t5. creation d'une partition		     "
	echo -e "\t6. supression d'une partition	     "
	echo -e "\t7. Quitter le programme                   "
	echo -e "\t\tEntrez une option: "
	read -n 1 option
}

while [ 1 ]
do
	menu
	case $option in

	1)
	clear
	creationArchive ;;
	

	2)
	clear
	ajouteFichiers ;;

	3)
	clear
	listeArchive  ;;

	4)
	clear
	extraireArchive ;;

	5)
	clear
	./partition.sh ;;
	
	6)
	clear
	./supprime.sh ;;
	7)
	break ;;

	*)
	clear
	echo "Désolé, mauvaise sélection!";;
	esac
	echo -en "\n\n\t\t\tAppuyez sur n'importe quelle touche pour continuer"
	read -n 1 line
done
clear




