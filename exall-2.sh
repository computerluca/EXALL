
#!/bin/bash
function crea_file { 
 touch file.txt
 echo "Nuovo avvio $(date)" >> file.txt 
}
function verifica_tipo  {
 read -p "Inserisci il tipo di comando da eseguire \n 
 p per aprire un programma in background,
 l per eseguire un comando libero,
 fr per aprire un file,
 fx per eseguire un file"
 read tipo
 if [ -z $tipo ]; then
 echo Errore indica il tipo di comando da eseguire
 fi
 if [[ $tipo == 'l' ]]; then
  esegui_comando
 fi
 if [[ $tipo == 'p' ]]; then
 apri_background
 fi
 if [[ $tipo == 'fr' ]]; then
 apri_file
 fi
 if [[ $tipo == 'fx' ]]; then
 esegui_file
 fi
}
function apri_background {
 read -p "Indica il programma da eseguire in background"
 read comando
 bg = '&'
  echo "esecuzione comando apri in background programma:: $comando $bg" >>file.txt
    $(echo $comando $bg) 2>> file.txt;
   
     
}

function apri_file {
        read -p "Indica il file da aprire. Deve essere un file .txt e devi avere i permessi di lettura"
        read comando
        if [ -e $comando ]; then
        if [ -r $comando ]; then
            if [[ $comando == *.txt ]]; then
            echo "apertura file $comando" >> file.txt
            echo "Ecco il file";
            cat $comando;
            else
            echo "impossibile aprire il file $comando. Non è un file di testo" >> file.txt
            fi     
        else
            echo "impossibile aprire il file $comando. Non hai i permessi di lettura" >> file.txt
        fi
        else
            echo "impossibile aprire il file $comando. Il file non esiste" >> file.txt
            fi
         
         
}
 
function esegui_file {
        read -p "Indica il file da eseguire. Deve essere un file .sh e devi avere i permessi di esecuzione"
        read comando 
        
        if [ -e $comando ]; then
        if [ -x $comando ]; then
            if [[ $comando == *.sh ]]; then
            echo "esecuzione file $comando" >> file.txt
            echo "Ecco il file";
            ./$comando;
            else
            echo "impossibile aprire il file $comando. Non è un file eseguibile" >> file.txt
            fi
        else
            echo "impossibile aprire il file $comando. Non hai i permessi di esecuzione" >> file.txt
            fi
            else
            echo "impossibile aprire il file $comando. Il file non esiste" >> file.txt
            fi
         
}
function esegui_comando {
 read -p "Inserisci il comando libero"
 read comando
if [ -n $comando ]; then
                $(echo $comando);
                  echo "esecuzione comando libero:: $comando" >>file.txt
 
fi
 if [ -z $comando ]; then
  echo Errore indica il comando da eseguire
 fi
 
}
crea_file
verifica_tipo
