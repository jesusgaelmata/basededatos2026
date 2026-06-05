# Documentacion de Contenedores Docker de Sistemas Gestores de Base de Datos
[Imagen Docker](./img/docker.png)

## Contenedor de tutorial de docker 
docker pull docker/getting-started

docker run -d -p 80:80 docker/getting-started

- -d  detach (El proceso del contenedor se ejecuta en background)
- -p (port, publish) (Mapea el puerto)
- docker/getting-started (Nombre de la imagen)

## Contenedor del Sistema Gestor De Base de Datos MariaDB
docker pull mariadb

## Contenedor de docker de MariaDB sin volumen
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306 35026

## Contenedor de docker de MariaDB con volumen
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -v v-mariadbg2:/var/lib/mysql -p 3345:3306 35026

## Contenedor de Postgres con Volumen
docker run --name ServerPostgresG2 -e POSTGRESS_PASSWORD=123456

## Contenedor de SQLServer 2022 con Volumen
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=" \
   -u 0 \
   -p 1451:1433 --name SQLServerG2 \
   -d -v v-sqlserverg2:/var/opt/mssql/data \
   d01cc




## Comandos Docker

| Comando | Descripcion |
| :--- | :--- |
| docker pull nombre_imagen |  **Descarga una imagen de DokerHub**  [Docker Hub](http://hub.docker.com)
| docker images |  **Visualizar las imagenes que se encuentran en el Docker**
| docker ps |  **Visualiza todos los contenedores que estan encendidos**
| docker ps -a |  **Visualiza todos los contenedores que estan encendidos y apagados**
| docker stop idcontenedor |  **Detiene un contenedor**
| docker start idcontenedor |  **Enciende el contenedor**
| docker rm idcontenedor |  **Elimina un contenedor si esta apagado**
| docker rm -f idcontenedor |  **Elimina un contenedor este o no encendido**
