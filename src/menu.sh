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

done