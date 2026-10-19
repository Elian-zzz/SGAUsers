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
read -p "Ingrese nombre de usuario: " usuario
read -p "Ingrese nombre y apellido: " nombre_completo
read -p "Ingrese edad: " edad
read -p "Ingrese carrera: " carrera
read -p "Ingrese horas de uso: " horas 
read -p "Ingrese estado (ACTIVO/INACTIVO): " estado


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

esac

done