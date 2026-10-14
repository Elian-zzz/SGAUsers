# Funcion interfaz menú
function menu {

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

ARCHIVO_USUARIO=./datos/usuarios.txt

if [ ! -f $ARCHIVO_USUARIO ] 
then
touch $ARCHIVO_USUARIO

fi
;;

2)
read -p "Ingrese nombre de usuario: " usuario
read -p "Ingrese nombre y apellido: " nombre_completo
read -p "Ingrese edad: " edad
read -p "Ingrese carrera: " carrera
read -p "Ingrese horas de uso: " horas 
read -p "Ingrese estado (ACTIVO/INACTIVO): " estado



echo "$usuario:$nombre_completo:$edad:$carrera:$horas:$estado" >> $ARCHIVO_USUARIO
;;


esac

done