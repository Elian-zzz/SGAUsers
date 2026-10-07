mkdir -p datos reportes logs

ARCHIVO=./datos/usuarios.txt

if [ ! -f $ARCHIVO ] 
then

touch $ARCHIVO

fi