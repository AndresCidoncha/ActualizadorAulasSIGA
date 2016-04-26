#!/bin/bash

#RED
IP=0.0.0. #IP de la subred, EJ: 10.220.30.
current=1 #Primer host de la subred
last=254 #Ultimo host de la subred

#CREDENCIALES
alu=alu0000000000 #Tu alu (debes tener permisos de administrador en las aulas)

echo "TRYING" > actulist.log #Crea un fichero de log donde apuntara las IP de los ordenadores a los que se ha conectado
while [ $current -lt $last ]; do
  sshpass -p $1 ssh -o StrictHostKeyChecking=no $alu@$IP$current "./actualizarBardinux.sh $1"
  if [ $? -eq 0 ]; then
    echo $IP$current >> actulist.log
  fi
  ((current++))
done
echo "Actualizados "$(wc -l actulist.log | cut -d' ' -f1)" ordenadores"
