# LXC

Configuración básica para contenedores [LXC](https://linuxcontainers.org/lxc/introduction/) basados en Debian 12 ([bookworm](https://www.debian.org/releases/bookworm/)) sobre [Proxmox Virtual Environment](https://www.proxmox.com/en/proxmox-virtual-environment/overview).

## Preparación

### Actualización del sistema

1. Acceder como `root` desde la consola nativa de Proxmox para preparar el sistema para ejecutar el script.
2. Actualizar lista de repositorios es instalar `aptitude`:
    ```bash
    apt update && apt install -y aptitude
    ```
3. Actualizar el sistema con `aptitude`:
    ```bash
    aptitude safe-upgrade-y
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

### Creación de usuario adminsitrador

1. Instalar sudo
    ```bash
    apt install sudo
    ```

2. Crear usuario con permisos de sudo:
    ```bash
    useradd -m -s /bin/bash [user_name] && usermod -aG sudo [user_name]
    ```
3. Definir contraseña para el nuevo usuario:
    ```bash
    passwd [user_name]
    ```
4. Cerrar sesión e iniciar con el usuario nuevo para validar.