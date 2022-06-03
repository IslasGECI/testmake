<a href="https://www.islas.org.mx/"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# TestMake

TestMake verifica que Make puede construir un objetivo dentro de un contenedor de Docker

## 📋 Prerequisitos

Estas instrucciones son para instalar y configurar TestMake en Ubuntu 20.04 (Focal Fossa).

Instala cURL, Git, Make y Docker.

```shell
sudo apt update && sudo apt install curl git make docker.io
```

Para correr Docker sin `sudo` (y evitar el mensaje: _Got permission denied..._) agrega tu usuario al
grupo `docker`:

```shell
sudo usermod -aG docker $USER
```

Reinicia tu máquina para que el sistema re-evalue tu pertenencia al grupo `docker`.

Verifica que puedes correr Docker sin `sudo`:

```shell
docker run hello-world
```
## 🛂 Credenciales de Bitbucket

Al final de tu archivo `~/.profile`, agrega la líne siguiente:

```shell
source $HOME/.vault/.secrets
```

Ejecuta `~/.profile` para cargar tus credenciales de Bitbucket como variables de entorno.

```shell
source ~/.profile
```

## 🏗️ Instalación de TestMake

```shell
git clone https://github.com/IslasGECI/testmake.git
cd testmake
sudo make install
cd ..
sudo rm --recursive testmake
```

## ✅ Verifica la instalación

Para verificar la instalación ejecutaremos:

```shell
geci-testmake hola mundo
```

Un mensaje te confirmará que `geci-testmake` se ejecutó exitosamente y por lo tanto TestMake fue
instalado correctamente.
