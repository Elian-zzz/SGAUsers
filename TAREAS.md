# Tareas

## Tareas por orden


- 1 
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
