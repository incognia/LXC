# LXC
[![Content license: CC-BY-SA 4.0](https://img.shields.io/badge/Content-CC_BY--NC--SA_4.0-05b5da.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![Code license: GNU GPL v3](https://img.shields.io/badge/Code-GNU_GPL_v3-bd0000.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html) ![Proxmox](https://img.shields.io/badge/Proxmox-v8.0.3-e57000.svg) ![Debian](https://img.shields.io/badge/Debian-v12.4-d80150.svg)

## Tabla de contenidos

- [Acerca de](#acerca-de)
- [Instalación](#instalación)
- [Opcional](#opcional)
- [Licencias](#licencias)

## Acerca de

Configuración básica para contenedores [LXC](https://linuxcontainers.org/lxc/introduction/) basados en Debian GNU/Linux 12 ([bookworm](https://www.debian.org/releases/bookworm/)) sobre [Proxmox Virtual Environment](https://www.proxmox.com/en/proxmox-virtual-environment/overview).

## Instalación

### Actualización del sistema

1. Acceder como `root` al contenedor para preparar el sistema para ejecutar el script. Puede ser desde la consola web nativa de Proxmox o usando `lxc-attach -n [id]` dentro de la shell del sistema anfitrión.
2. Actualizar lista de repositorios es instalar `aptitude`:
    ```bash
    apt update && apt install -y aptitude
    ```
3. Actualizar el sistema con `aptitude`:
    ```bash
    aptitude safe-upgrade -y
    ```
4. Reiniciar el contenedor:
    ```bash
    init 6
    ```

### Configuración regional del entorno

1. Acceder nuevamente como `root`.

2. Reconfigurar las `locales`:
    ```bash
    dpkg-reconfigure locales
    ```
   - Seleccionar la opción `es_MX.UTF-8` y definir la como predeterminada (default).
   - Mostrar el contenido del archivo `/etc/default/locale` para validar el cambio:
      ```bash
      cat /etc/default/locale
      ```

3. Establecer la zona horaria:
    ```bash
    timedatectl set-timezone America/Mexico_City
    ```
   - Ejecutar `date` para validar el cambio.

4. Cerrar sesión.

### Creación de usuario adminsitrador

1. Acceder nuevamente como `root`.

2. Instalar sudo
    ```bash
    apt install -y sudo
    ```

3. Crear usuario con permisos de sudo:
    ```bash
    useradd -m -s /bin/bash [user_name] && usermod -aG sudo [user_name]
    ```

4. Definir contraseña para el nuevo usuario:
    ```bash
    passwd [user_name]
    ```

5. Cerrar sesión e iniciar con el usuario nuevo para validar.

### Instalar `git` y descargar este repositorio

1. Acceder con el nuevo usuario e instalar `git` usando `sudo`:
    ```bash
    sudo apt install -y git
    ```
2. Clonar este reposidorio:
    ```bash
    git clone https://github.com/incognia/LXC
    ```
### Instalar paquetes adicionales

1. Acceder al directorio clonado:
    ```bash
    cd LXC
    ```
2. Ejecutar el script incluido:
    ```bash
    sudo ./debian-setup.sh
    ```

## Opcional

Habilitar los números de línea en `nano`:
```bash
echo "set linenumbers" > ~/.nanorc
```

## Licencias

- Contenido: [Creative Commons BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
- Código: [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.en.html)