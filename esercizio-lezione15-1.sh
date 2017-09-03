
#!/bin/bash
#Ciclare su tutti i file con estensione php di una cartella  e creare una nuova cartella che contiene tali file.
#Eseguire la stessa operazione sia con un ciclo for sia con un solo comando, che abbiamo visto nelle lezioni precedenti
mkdir cartella
for file in *.php; 
do
   cp "$file" "cartella/$file"
done
#con un solo comando

cp *.php cartella 
