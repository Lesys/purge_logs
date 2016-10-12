::@ECHO off permet de ne pas affichier chaque ligne exécutée du programme
@ECHO off
TITLE BatchFile
MODE con cols=200 lines=50
COLOR 0F
setlocal EnableDelayedExpansion

::Recherche préalable de la date la plus récente ==> dateRec

::Déclare la variable i qui sera le numéro de la ligne en traitement
::SET i=0 ou SET i=1
::Pour chaque ligne dans le fichier de log:
FOR /F "TOKENS=1,2,3 DELIMS= " %%a IN (%dos1%) DO (
	::Si le début de la ligne (3 premiers groupes de charactères) == la regexp de date:
	set dateLigne=%%a %%b %%c
		::Si cette même date est plus ancienne de 31 jours par rapport à la date la plus récente:
		IF dateLigne == (
			::Tant que la ligne ne commence pas par une date:
			::Etiquette de début de suppression de ligne
			:STARTSUPP
			set dateLigne2=%%a %%b %%c
			::Si la ligne est une date: ne pas supprimer et sortir de la pseudo-boucle
			IF dateLigne2 == regexp GOTO STOPSUPP
			::Si la ligne en question n'est pas une ligne de date:
			del ligne
			GOTO STARTSUPP
		)
	::Etiquette d'arrêt de la suppression de ligne
	:STOPSUPP

	::La variable contenant le numéro de ligne en cours de traitement augmente de 1
	::SET /a i=!i!+1
)
PAUSE > NUL


::REGEXP:
	::Cette RegExp permet de trouver les lignes contenant en 3 premières chaines de caractères des date entre le 1 Janvier 1900 et le 31 Décembre 2999 ou 1900-01-01 et 2999-12-31 (sans compter le 29 Février ou les années bissextiles)
	::(([1-9]|[12][0-9]|3[01]) ([Jj]anvier|[Ff][ée]vrier|[Mm]ars|[Aa]vril|[Mm]ai|[Jj]uin|[Jj]uillet|[Aa]o[ûu]t|[Ss]eptembre|[Oo]ctobre|[Nn]ovembre|[Dd][ée]cembre) (19[0-9]{2}|2[0-9]{3})|(19[0-9]{2}|2[0-9]{3})-(0[1-9]|[1-9]|1[0-2])-([1-9]|[12][0-9]|3[01]))