# ActualizadorAulasSIGA

Dos pequeños scripts para simplificar la tarea de actualizar bardinux en las aulas SIGA de la ULL

## Como actualizar las aulas (Modo pereza)

**1.** El actualizarBardinux.sh debes meterlo dentro de tu disco privado de la ull (inicia sesión en un ordenador con bardinux con tu alu y cópialo dentro de la carpeta private) y editarlo para poner tu contraseña del alu (en la variable pass). 
**IMPORTANTE:** edita los permisos para poder ejecutarlo externamente con un chmod.

**2.** Una vez hecho esto, enciende todos los ordenadores del aula a actualizar, inicia sesión con el usuario administrador (para que no se apaguen), y en uno de ellos ejecuta ifconfig. En la parte donde dice eth0 busca el campo Direc. Inet: y apunta la dirección IP de la subred (Por ejemplo si dice 10.220.30.128 la parte que nos interesa son los 3 primeros números).

**3.** Edita la variable IP en actuaulas.sh para que coincida con la IP de la subred, además de poner tu alu en la variable alu. Después abre una terminal en el escritorio y ejecuta ./actuaulas seguido de tu contraseña. 

  **EJ:** ./actuaulas contraseña

**4.** Un log de las IP a las que ha intentado conectarse saldrá en actulist.log, si quieres echarle un ojo según avanza hazle un cat. Para ver el progreso en tiempo real: 

~~~
while [ true ]; do lineas2=$(wc -l actulist.log | cut -d' ' -f1); if [ $lineas != $lineas2 ]; then cat actulist.log; let lineas=lineas2; fi; done
~~~
