Tarea Setiembre a realizar de 2 alumnos.
 Entrega y evaluación 28 de setiembre 

Desarrollar un sistema de administración de información utilizando scripts de Shell,
La tarea deberá ejecutarse completamente desde una terminal Linux y no deberá utilizar interfaces gráficas.

## CONSIGNA
"Una institución educativa necesita llevar un registro de los usuarios
  que utilizan sus sistemas informáticos"
Donde:cada usuario posee:
 Nombre de usuario.
 Nombre y apellido.
 Edad.
 Carrera o área.
 Cantidad de horas de uso del sistema.
 Estado: ACTIVO o INACTIVO.

 La información deberá almacenarse en archivos de texto 
  y ser administrada mediante scripts de Shell.

REQUERIMIENTOS
 La tarea deberá contar con un script principal denominado 
  sistema.sh.
 Al ejecutarlo, deberá mostrar un menú "similar" al siguiente:

 SISTEMA DE ADMINISTRACION DE USUARIOS
 ------- -- -------------- -- --------

1. Crear estructura del sistema
2. Agregar usuario
3. Listar usuarios
4. Buscar usuario
5. Generar estadísticas
6. Generar reporte
7  Registrar actividad
8. Salir

Seleccione una opción:

opcion 1.
  Crear estructura del sistema
  El sistema deberá crear, mediante comandos de Shell, una estructura de directorios 
     que contenga (entre otros) los siguientes directorios : datos, reportes y logs
  Dentro de datos deberá existir un archivo denominado:
    usuarios.txt
  El script deberá verificar si los directorios y archivos ya existen antes de crearlos.

opcion 2 - Agregar usuario
  El sistema deberá solicitar al usuario los datos necesarios y almacenarlos en usuarios.txt.
  Ejemplo:

   	Ingrese nombre de usuario: mia01
  	Ingrese nombre y apellido: Mia Perez
	Ingrese edad: 18
	Ingrese carrera: Informatica
	Ingrese horas de uso: 15
	Ingrese estado (ACTIVO/INACTIVO): ACTIVO


 Los datos deberán almacenarse utilizando un formato definido por los alumnos que realizen la tarea
 Por ejemplo:
	mia01|Mia Perez|18|Informatica|15|ACTIVO
	maria02|Maria Gomez|25|Administracion|8|ACTIVO
	pedro03|Pedro Lopez|19|Informatica|2|INACTIVO

3. Listar usuarios
   El sistema deberá mostrar los usuarios almacenados.

4. Buscar usuario
   El sistema deberá solicitar un nombre de usuario y buscarlo dentro del archivo.
   Deberá informar los datos del usuarios si  existe o 
       "usuario no existe" si no existe.

Ejemplo:

  Ingrese usuario a buscar: mia01

  Usuario encontrado:
    mia01|Mia Perez|18|Informatica|15|ACTIVO
  Si no existe:
    El usuario no existe.


5. Generar estadísticas
   El sistema deberá calcular y mostrar información sobre los usuarios registrados.
  
   Como mínimo deberá obtener:
      Cantidad total de usuarios.
       Cantidad de usuarios activos.
        Cantidad de usuarios inactivos.
         Cantidad de usuarios pertenecientes a cada carrera o área.
      Usuario con mayor cantidad de horas de uso.


6. Generar reporte
   El sistema deberá generar un archivo dentro del directorio reportes/.

  Por ejemplo:
    reportes/reporte.txt

  El reporte deberá contener la fecha de generación y las estadísticas obtenidas.
  Ejemplo:

	 REPORTE DEL SISTEMA
	Fecha: 23/09/2026

	Cantidad total de usuarios: 15
	Usuarios activos: 11
	Usuarios inactivos: 4

	Carreras:
	 Informatica: 7
	 Administracion: 5
         Contabilidad: 3

	Usuario con mayor cantidad de horas:
   	 juan04 - 35 horas

7. Registrar actividad
   que permita almacenar en logs/actividad.txt las operaciones realizadas por los usuarios.

   Por ejemplo:

	23/08/2026 14:30 - Se agregó usuario juan01
	24/08/2026 14:35 - Se realizó búsqueda de maria02
	25/08/2026 14:40 - Se generó reporte

8. Menú principal 
   El menú deberá mantenerse activo hasta que el usuario seleccione la opción Salir.

   El sistema deberá validar las opciones ingresadas 
     Por ejemplo:
     Seleccione una opción: 9
     Opción inválida.
       Intente nuevamente.


REQUERIMIENTOS
 Requisitos  obligatorios

 La tarea deberá cumplir como mínimo con los siguientes requisitos:

 Estar desarrollado utilizando Shell Script 
 Utilizar variables.
 Utilizar mkdir.
 Crear y manipular archivos de texto.
 Utilizar redireccionamiento > y/o >>.
 Utilizar al comandos de filtrado.
 Utilizar if.
 Utilizar while.
 Utilizar case o una estructura equivalente para el menú.
 Utilizar lectura de datos mediante read.
 Verificar la existencia de archivos o directorios.
 Generar al menos un archivo de reporte.
 Mostrar mensajes claros al usuario.
 Manejar entradas inválidas.
 Comentar las partes principales del código.
  
 Entrega y evaluación 28 de setiembre 

 Puntaje
	Estructura y funcionamiento general	20%
	Uso correcto de archivos y directorios	15%
                      Redireccionamiento	10%
                          Uso de filtros	15%
                        if, while y case	15%
              Validación de datos y errores	10%
                 Reportes y presentación	5%
                           uso funciones	5%
                    uso parametros en funciones 5%
                                   Total	100%
