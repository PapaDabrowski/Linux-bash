#!/bin/zsh
#Author: PapaDabrowski


#####Poprawne uruchomienie skryptu #### 

if [ $# -ne 3 ]; then
   echo "Niewystarczająca liczba argumentów" 
   echo "Poprawna składnia: -> zamien plik tekst_zamieniany tekst_wstawiany"
   exit 0
else 
  text_find="$2"
  text_replace="$3" 
  our_file="$1"
fi 


#####Sprawdzenie pliku  ####

if   [ ! -f "$our_file" ]; then 
     echo "File with that name does not exist."
     exit 1 
elif [ ! -r "$our_file" ]; then 
     echo "Permission Denied"
     exit 2 
elif [ ! -w . ]; then 
     echo "Cannot Save New File"
     exit 3
fi 

##### Właściwa część skrpytu #####

n=1
while [[ -f "$our_file.$n" ]]; do 
   n=$((n+1))
done


 
sed -e 's/'"$text_find"'/'"$text_replace"'/g' "$our_file" > $our_file.$n

echo "Skrypt został wykonany poprawnie"


