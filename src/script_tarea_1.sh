mkdir -p datos reportes logs

ARCHIVO_USUARIO=./datos/usuarios.txt

if [ ! -f $ARCHIVO ] 
then
touch $ARCHIVO

fi