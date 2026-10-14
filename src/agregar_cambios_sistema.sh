#!/bin/bash
read -p "(1) Matias o (2) Elian: [1,2]: " destino

case $destino in
1)
rsync -av sistema_matias.sh sistema.sh
;;
2)
rsync -av sistema_elian.sh sistema.sh
;;
*)
echo "Ingreso invalido"
;;
esac