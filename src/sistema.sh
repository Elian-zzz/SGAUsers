#!/bin/bash

#funciones
ARCHIVO_USUARIO="./datos/usuarios.txt"
ARCHIVO_REPORTES="./reportes/reportes_usuarios.txt"
ARCHIVO_LOGS="./logs/log_sistema.log"

crear_log() {
    # tipoerror[date]> mensaje 
    printf "%s[%s]> %s \n" "$2" "$(date +'%Y/%m/%d %T')" "$1" >> "$ARCHIVO_LOGS"
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
echo "7) Consultar logs"
echo "8) Salir"
}
# declaracion de variables

op=1


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


if [ -z "$usuario" ] || [ -z $nombre_completo ] || [ -z $edad ] || [ -z $carrera ] || [ -z $horas ] || [ -z $estado ]; then
crear_log "Intento fallido de creacion de usuario" "ERROR"
echo "ERROR: No se pudo agregar el usuario, datos incompletos"
else
echo "$usuario:$nombre_completo:$edad:$carrera:$horas:$estado" >> $ARCHIVO_USUARIO
echo "Usuario $nombre_completo agregado correctamente"
crear_log "Usuario $nombre_completo agregado al sistema" "LOG"
fi

siguiente_enter
;;
3) 
echo "____Usuarios del sistema____"
cat $ARCHIVO_USUARIO | cut -d: -f1
echo ""

siguiente_enter
crear_log "Listando usuarios del sistema" "LOG"
;;
4)
echo ""
echo "____Buscar Usuarios del sistema____"
read -p "Ingrese usuario a buscar: " usuario
USUARIO_BUSCADO=$(grep -i "$usuario" $ARCHIVO_USUARIO)

if [ -z "$USUARIO_BUSCADO" ]; then
echo "Usuario $usuario no encontrado en el sistema"
crear_log "Buscando $usuario, usuario no existe en el sistema" "WARN"
else
echo "$USUARIO_BUSCADO"
crear_log "Buscando $usuario, usuario existente en el sistema" "LOG"
fi


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
CANTIDAD_USUARIOS_ADMINISTRACION=$(grep -wi "ADMINISTRACION" "$ARCHIVO_USUARIO" | wc -l)
MAYOR_CANTIDAD_HORAS=""
MAYOR_CANTIDAD_HORAS=$(awk -F: '{print $5}' "$ARCHIVO_USUARIO" | sort -n | tail -1)

echo "___Creando estadisticas del sistema___"
echo "Cantidad de usuarios: $CANTIDAD_USUARIOS"
echo "Cantidad de usuarios activos: $CANTIDAD_USUARIOS_ACTIVOS"
echo "Cantidad de usuarios inactivos: $CANTIDAD_USUARIOS_INACTIVOS"
echo "Cantidad de Usuarios Informatica: $CANTIDAD_USUARIOS_INFORMATICA"
echo "Cantidad de Usuarios Deporte: $CANTIDAD_USUARIOS_DEPORTE"
echo "Cantidad de Usuarios Administracion: $CANTIDAD_USUARIOS_ADMINISTRACION"
echo "Mayor cantidad de horas registradas: $MAYOR_CANTIDAD_HORAS"
echo "Usuario con mayor cantidad de horas: $(grep -w $MAYOR_CANTIDAD_HORAS $ARCHIVO_USUARIO)"
crear_log "Creando estadisticas del sistema" "LOG"
siguiente_enter
;;
6)
CANTIDAD_USUARIOS=$(wc -l "$ARCHIVO_USUARIO" | awk '{print $1}')
CANTIDAD_USUARIOS_ACTIVOS=$(grep -wi "activo" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_INACTIVOS=$(grep -wi "inactivo" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_INFORMATICA=$(grep -wi "INFORMATICA" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_DEPORTE=$(grep -wi "DEPORTE" ./datos/usuarios.txt | wc -l)
CANTIDAD_USUARIOS_ADMINISTRACION=$(grep -wi "ADMINISTRACION" "$ARCHIVO_USUARIO" | wc -l)
MAYOR_CANTIDAD_HORAS=""
MAYOR_CANTIDAD_HORAS=$(awk -F: '{print $5}' "$ARCHIVO_USUARIO" | sort -n | tail -1)
USUARIO_MAYOR_HORAS=$(grep -w "$MAYOR_CANTIDAD_HORAS" "$ARCHIVO_USUARIO")
NOMBRE_USUARIO_MHORAS=$(echo "$USUARIO_MAYOR_HORAS" | cut -d: -f1)
HORAS_USUARIO_MHORAS=$(echo "$USUARIO_MAYOR_HORAS" | cut -d: -f5)
FECHA=$(date +"%D %T")
#REPORTE DEL SISTEMA
#Fecha: 23/09/2026

#Cantidad total de usuarios: 15
#Usuarios activos: 11
#Usuarios inactivos: 4

#Carreras:
#Informatica: 7
#Administracion: 5
#Contabilidad: 3

#Usuario con mayor cantidad de horas:
#juan04 - 35 horas

echo "REPORTE DEL SISTEMA" > "$ARCHIVO_REPORTES" 
echo "Fecha: $FECHA" >> "$ARCHIVO_REPORTES"
echo "Cantidad total de usuarios: $CANTIDAD_USUARIOS" >> "$ARCHIVO_REPORTES"
echo "Usuarios activos: $CANTIDAD_USUARIOS_ACTIVOS" >> "$ARCHIVO_REPORTES"
echo "Usuarios inactivos: $CANTIDAD_USUARIOS_INACTIVOS" >> "$ARCHIVO_REPORTES"
echo "" >> "$ARCHIVO_REPORTES"
echo "Carreras: " >> "$ARCHIVO_REPORTES"
echo "Informatica: $CANTIDAD_USUARIOS_INFORMATICA" >> "$ARCHIVO_REPORTES"
echo "Administracion: $CANTIDAD_USUARIOS_ADMINISTRACION" >> "$ARCHIVO_REPORTES"
echo "Deporte: $CANTIDAD_USUARIOS_DEPORTE" >> "$ARCHIVO_REPORTES"
echo "" >> "$ARCHIVO_REPORTES"
echo "Usuario con mayor cantidad de horas:" >> "$ARCHIVO_REPORTES"
echo "$NOMBRE_USUARIO_MHORAS - $HORAS_USUARIO_MHORAS horas" >> "$ARCHIVO_REPORTES"
echo "Registro del $FECHA realizado"
crear_log "Reporte: $FECHA realizado correctamente" "LOG"
siguiente_enter

;;
7)
echo ""
echo "___LOGS DEL SISTEMA___"
tail "$ARCHIVO_LOGS"
echo ""
siguiente_enter
;;
esac

done