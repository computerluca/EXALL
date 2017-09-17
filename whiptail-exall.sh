function crea_file { 
 touch file.txt
 echo "Nuovo avvio $(date)" >> file.txt 
}
function apri_background {
 variabile=$(whiptail --inputbox "Indica il programma da eseguire in background" 8 78 --title "Programma in Background" 3>&1 1>&2 2>&3)
 exitstatus=$?
 if [ $exitstatus = 0 ]; then
  echo "esecuzione comando apri in background programma:: $variabile &" >>file.txt
    $(echo $variabile &) 2>> file.txt;
 fi
}
function apri_file {
		variabile=$(whiptail --inputbox "Indica il file da aprire. Deve essere un file .txt e devi avere i permessi di lettura" 8 78 --title "Apertura file" 3>&1 1>&2 2>&3)
        exitstatus=$?
         if [ $exitstatus = 0 ]; then

        if [ -z $variabile ]; then
						variabile=$(whiptail --title "Errore - Apertura File" --msgbox "non hai inserito il nome file" 8 78 3>&1 1>&2 2>&3)
		else
        if [ -e $variabile ]; then
        if [ -r $variabile ]; then
			
            if [[ $variabile == *.txt ]]; then
            echo "apertura file $variabile" >> file.txt
            echo "Ecco il file";
			variabile=$(whiptail --textbox $variabile --scrolltext 12 80 3>&1 1>&2 2>&3)
            else
				variabile=$(whiptail --title "Errore - Apertura File" --msgbox "impossibile aprire il file $variabile. Non è un file di testo" 8 78 3>&1 1>&2 2>&3)
				echo "impossibile aprire il file $variabile. Non è un file di testo" >> file.txt
            fi     
        else
            variabile=$(whiptail --title "Errore - Apertura File" --msgbox "impossibile aprire il file $variabile. Non hai i permessi di lettura" 8 78 3>&1 1>&2 2>&3)
            echo "impossibile aprire il file $variabile. Non hai i permessi di lettura" >> file.txt
		fi
        else
			variabile=$(whiptail --title "Errore - Apertura File" --msgbox "impossibile aprire il file $variabile. Il file non esiste" 8 78 3>&1 1>&2 2>&3)
            echo "impossibile aprire il file $variabile. Il file non esiste" >> file.txt
        fi
        fi
        fi
}
function esegui_file {
		variabile=$(whiptail --inputbox "Indica il file da eseguire. Deve essere un file .sh e devi avere i permessi di esecuzione" 8 78 --title "Esegui file" 3>&1 1>&2 2>&3)
        exitstatus=$?
         if [ $exitstatus = 0 ]; then
         if [ -z $variabile ]; then
			variabile=$(whiptail --title "Errore - Esegui File" --msgbox "non hai inserito il nome file" 8 78 3>&1 1>&2 2>&3)
          else
        if [ -e $variabile ]; then
        if [ -x $variabile ]; then
            if [[ $variabile == *.sh ]]; then
            echo "esecuzione file $variabile" >> file.txt
            echo "Ecco il file";
            ./$variabile;
            else
            variabile=$(whiptail --title "Errore - Esegui File" --msgbox "impossibile aprire il file $variabile. Il file non è eseguibile" 8 78 3>&1 1>&2 2>&3)

            echo "impossibile aprire il file $variabile. Non è un file eseguibile" >> file.txt
            fi
        else
            variabile=$(whiptail --title "Errore - Esegui File" --msgbox "impossibile aprire il file $variabile. Non hai i permessi di esecuzione" 8 78 3>&1 1>&2 2>&3)

            echo "impossibile aprire il file $variabile. Non hai i permessi di esecuzione" >> file.txt
            fi
            else
            variabile=$(whiptail --title "Errore - Esegui File" --msgbox "impossibile aprire il file $variabile. Il file non esiste" 8 78 3>&1 1>&2 2>&3)

            echo "impossibile aprire il file $variabile. Il file non esiste" >> file.txt
            fi
        fi
        fi
         
}
function esegui_comando {
	 variabile=$(whiptail --inputbox "Inserisci il comando libero" 8 78 --title "Comando libero" 3>&1 1>&2 2>&3)
	 exitstatus=$?
	  if [ -z $variabile ]; then
			variabile=$(whiptail --title "Errore - ComandoLibero"  --msgbox " Errore indica il comando da eseguire" 8 8 3>&1 1>&2 2>&3)
 else
 if [ $exitstatus = 0 ]; then

                $(echo $variabile);
                  echo "esecuzione comando libero:: $variabile" >>file.txt
 fi
 fi
}
function pagina_principale(){
variabile=$(whiptail --title 'EXALL' --menu 'Inserisci il tipo di comando da eseguire' 25 78 16 \
'Apri' 'per aprire un programma in background' \
'Esegui' 'per eseguire un programma' \
'ApriFile' 'per aprire un file' \
'EseguiFile' 'per eseguire un file' \
 3>&1 1>&2 2>&3)
}

crea_file
while true
do
pagina_principale
exitstatus=$?
if [ $exitstatus -eq 1 ]; then
  break
fi
case $variabile in "Apri")   
 apri_background
;;
"ApriFile")
apri_file
;;
"Esegui")
esegui_comando
;;
"EseguiFile")
esegui_file
;;

esac

 
done
