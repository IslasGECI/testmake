# 🛠️ Herramientas Misceláneas (MiscTools)

Conjunto de herramientas pequeñas y prototipos del equipo de Ciencia de Datos de GECI.

## 🧰 Lista de herramientas


| Herramienta         | Descripción  |
| ------------------- | ------------ |
| geci-checkanalyses  | Usa jsonschema para verificar la estructura de analyses.json  |
| geci-tdp2xls        | Transforma tabular data packages a Excel  |
| geci-testmake       | Verifica que 'make' puede construir un objetivo dentro de un contenedor de Docker  |
| geci-validate       | Verifica que un data package cumple con el protocolo de GECI  |


## 📋 Prerequisitos para `geci-testmake`

Estas instrucciones son para instalar y configurar MiscTools en Ubuntu 20.04 (Focal Fossa).

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
### 📋 Prerequisitos para `geci-checkanalyses`

Instala `jsonschema`.
```
$ pip install jsonschema
```

### 📋 Prerequisitos para `geci-validate`

Instala `goodtables`.
```shell
pip install goodtables
```

## 🛂 Credenciales de Bitbucket

Al final de tu archivo `~/.profile`, agrega las dos líneas siguientes:

```shell
export BITBUCKET_USERNAME=<USUARIO>
export BITBUCKET_PASSWORD=<CONTRASEÑA>
```

(Sustituye `<USUARIO>` y `<CONTRASEÑA>` con las credenciales correspondientes)

Ejecuta `~/.profile` para cargar tus credenciales de Bitbucket como variables de entorno.

```shell
. ~/.profile
```

## 🏗️ Instalación de MiscTools

```shell
git clone https://github.com/IslasGECI/misctools.git
cd misctools
sudo make install
cd ..
sudo rm --recursive misctools
```

## ✅ Verifica la instalación

Para verificar la instalación ejecutaremos una de las herramientas instaladas:

```shell
geci-testmake hola mundo
```

Un mensaje te confirmará que `geci-testmake` se ejecutó exitosamente y por lo tanto MiscTools fue
instalado correctamente.
