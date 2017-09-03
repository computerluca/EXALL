#!/bin/bash
#Ciclare su tutti i file di una cartella a vostra scelta. Se trovate un file eseguibile
#(ovvero che ha permessi di esecuzione, guardate il codice di exall o la lezione sui permessi),
#uscite dal ciclo e scrivete  a schermo: Boom!
#Se trovate un file che ha estensione txt visualizzatene il contenuto a schermo
#Create un file output.txt con il contenuto dei vari file txt di cui effettuate la lettura
#Stampiamo a schermo il file output.txt che avete ottenuto
touch output.txt
for file in cartella/*; do

if [ -x $file ]; 
then
  echo "boom"
  break
fi
 if [[ $file == *.txt ]]; then
 cat $file
 cat $file >> output.txt
done
cat output.txt
