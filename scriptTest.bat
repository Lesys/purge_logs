::@ECHO off permet de ne pas affichier chaque ligne exécutée du programme
@ECHO off
TITLE BatchFile
MODE con cols=200 lines=50
COLOR 0F

::ModIFie le répertoire courant pour aller dans celui en dessous
CD C:\Users\charly.attrait\Documents\programmes\batch
::Affiche le nouveau répertoire courant
ECHO %CD%
::Affecte "text.txt" à la variable "var"
SET var=text.txt
::Si le fichier ou dossier "text.txt" (ce que contient la variable var) existe:
IF EXIST text.txt ( 
	::Affiche que le fichier/dossier existe
	ECHO Fichier "%var%" existe
) ELSE ( 
::Si le fichier/dossier n'existe pas
	::Affiche qu'il n'existe pas
	ECHO Fichier "%var%" n'existe pas
	)
::Affecte "test.txt" à la variable "var2"
SET var2=test.txt
::Si le fichier ou dossier "test.txt" (ce que contient la variable var) existe:
IF EXIST test.txt ( 
	::Supprime le fichier/dossier
	ECHO "%var2%" existe, supprimons le!
	DEL %var2%
	MD testtest
	) ELSE (
::Si le fichier/dossier n'existe pas
	::Affecte une valeur au fichier
	ECHO "%var2%" n'existe pas, creons le!
	ECHO TestduTest > %var2%
	MD testtest
	)

::Permet de pouvoir lire la console et de la fermet par un appuit sur une touche
PAUSE > NUL