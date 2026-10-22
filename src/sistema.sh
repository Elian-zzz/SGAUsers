#!/bin/bash

#funciones

crear_log() {
    # tipoerror[date]> mensaje 
    printf "%s[%s]> %s \n" "$2" "$(date +'%Y/%m/%d %T')" "$1" >> ./logs/log_sistema.log
}

siguiente_enter() {
    read -p "Presione ENTER para continuar:.." o
}
# Funcion interfaz menú
menu() {

echo "===== SISTEMA DE ADMINISTRACION DE USUARIOS ====="
echo "1) Crear estructura del sistema"
echo "2) Agregar usuario"
echo "3) Listar usuarios"
echo "4) Buscar usuarios"
echo "5) Generar estadisticas"
echo "6) Generar reporte"
echo "7) Registrar actividad"
echo "8) Salir"
}
# declaracion de variables

op=1

ARCHIVO_USUARIO="./datos/usuarios.txt"
ARCHIVO_REPORTES="./reportes/reportes_usuarios.txt"
ARCHIVO_LOGS="./logs/log_sistema.log"
while [[ $op -ne 8 ]]
do

# Limpiar la interfaz
clear

# Funcion interfaz menú
menu
read -p "Ingrese una opcion [1 - 8]: " op

case $op in
1)
    mkdir -p datos reportes logs


if [ ! -f $ARCHIVO_USUARIO ] || [ -f $ARCHIVO_REPORTES ] || [ -f $ARCHIVO_LOGS ] 
then
touch $ARCHIVO_USUARIO
touch $ARCHIVO_REPORTES
touch $ARCHIVO_LOGS
fi
crear_log "Creando estructura del sistema" "LOG"
;;

2)
control=1
read -p "Ingrese nombre de usuario: " usuario
read -p "Ingrese nombre y apellido: " nombre_completo
read -p "Ingrese edad: " edad
echo ""
echo "__SELECCION CARRERA__"
while [ $control -eq 1 ]; do
echo "1) INFORMATICA"
echo "2) ADMINISTRACION"
echo "3) DEPORTE"
read -p "Ingrese carrera : " carrera
case $carrera in
1)
carrera="INFORMATICA"
control=0
;;
2)
carrera="ADMINISTRACION"
control=0
;;
3)
carrera="DEPORTE"
control=0
;;
esac
done

read -p "Ingrese horas de uso: " horas 

control=1
echo ""
echo "__SELECCION ESTADO__"
while [ $control -eq 1 ]; do
echo "1) ACTIVO"
echo "2) INACTIVO"
read -p "Ingrese estado : " estado
case $estado in
1)
estado="ACTIVO"
control=0
;;
2)
estado="INACTIVO"
control=0
;;
esac
done


#for var in "$usuario" "$nombre_completo" "$edad" "$carrera" "$horas" "$estado";do
#if [ -z "$var" ]; then
echo "$usuario:$nombre_completo:$edad:$carrera:$horas:$estado" >> $ARCHIVO_USUARIO
echo "$nombre_completo agregado correctamente"
#fi
#done

crear_log "Usuario $nombre_completo agregado al sistema" "LOG"
;;
3) 
echo "____Usuarios del sistema____"
cat $ARCHIVO_USUARIO | cut -d: -f1
echo ""

siguiente_enter
crear_log "Listando usuarios del sistema" "LOG"
;;
4)
echo "____Buscar Usuarios del sistema____"
read -p "Ingrese usuario a buscar: " usuario
grep -i "$usuario" $ARCHIVO_USUARIO
siguiente_enter
;;
5) 
echo ""
CANTIDAD_USUARIOS=$(wc -l "$ARCHIVO_USUARIO" | awk '{print $1}')
CANTIDAD_USUARIOS_ACTIVOS=$(grep -wi "activo" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_INACTIVOS=$(grep -wi "inactivo" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_INFORMATICA=$(grep -wi "INFORMATICA" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_DEPORTE=$(grep -wi "DEPORTE" ./datos/usuarios.txt | wc -l)
# A terminar cantidad de usuarios de administración
CANTIDAD_USUARIOS_ADMINISTRACION=$()
echo "___Creando estadisticas del sistema___"
echo "Cantidad de usuarios: $CANTIDAD_USUARIOS"
echo "Cantidad de usuarios activos: $CANTIDAD_USUARIOS_ACTIVOS"
echo "Cantidad de usuarios inactivos: $CANTIDAD_USUARIOS_INACTIVOS"
echo "Cantidad de Usuarios Informatica: $CANTIDAD_USUARIOS_INFORMATICA"
echo "Camtodad de Usuarios Deporte: $CANTIDAD_USUARIOS_DEPORTE"
siguiente_enter
;;
esac

done