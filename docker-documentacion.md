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


## Comandos Docker

| Comando | Descripcion |
| :--- | :--- |
| docker pull nombre_imagen |  **Descarga una imagen de DokerHub**  [Docker Hub](http://hub.docker.com)
| docker images | Visualizar las imagenes que se encuentran en el Docker

docker pull postgres:14.22-trixie 

docker pull mcr.microsoft.com/mssql/server:2022-latest