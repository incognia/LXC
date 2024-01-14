# LXC

## Preparación

- Acceder como `root` desde la consola nativa de Proxmox para preparar el sistema para ejecutar el script.
- Actualizar lista de repositorios es instalar `aptitude`:
  ```bash
  apt update && apt install -y aptitude
  ```
- Actualizar el sitema con `aptitude`:
  ```bash
  aptitude safe-upgrade-y
  ```
- Reiniciar el contenedor:
  ```bash
  init 6
  ```
- Acceder nuevamente como `root`.
- Instalar git y sudo
  ```bash
  apt install -y git sudo
  ```
- Reconfigurar las `locales`:
  ```bash
  dpkg-reconfigure locales
  ```
  - Seleccionar la opción `es_MX.UTF-8` y definira como predeterminada (default).
  - Mostrar el contenido del archivo `/etc/default/locale` para validar el cambio:
    ```bash
    cat /etc/default/locale
    ```
- Establecer la zona horaria:
  ```bash
  timedatectl set-timezone America/Mexico_City
  ```
  - Ejecutar `date` para validar el cambio.
- Crear usuario con permisos de sudo:
  ```bash
  useradd -m -s /bin/bash [user_name] && usermod -aG sudo [user_name] && passwd [user_name]
  ```
