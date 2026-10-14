read -p "Ingrese nombre de usuario: " usuario
read -p "Ingrese nombre y apellido: " nombre_completo
read -p "Ingrese edad: " edad
read -p "Ingrese carrera: " carrera
read -p "Ingrese horas de uso: " horas 
read -p "Ingrese estado (ACTIVO/INACTIVO): " estado

echo "$usuario:$nombre_completo:$edad:$carrera:$horas:$estado" > $ARCHIVO_USUARIO