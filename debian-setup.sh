#!/bin/bash

# Verificar si se está ejecutando como root
if [ "$(id -u)" != "0" ]; then
    # Verificar si se está ejecutando con sudo
    if [ -n "$SUDO_USER" ]; then
        echo "Este script debe ejecutarse como root o con sudo."
        echo "Por favor, utiliza sudo $0 para ejecutarlo correctamente."
    else
        echo "Este script debe ejecutarse como root o con sudo."
        echo "Por favor, inicia sesión como root o utiliza sudo $0 para ejecutarlo correctamente."
    fi
    exit 1
fi

# El resto del script continua aquí para las operaciones que requieren privilegios de root.

echo "El script se está ejecutando con privilegios de root o sudo. ¡Continuemos!"

# Agrega el resto de las operaciones que requieren privilegios de root aquí.

# Instalar paquetes adicionales de forma silenciosa
apt-get install -y bash-completion btop curl mc neofetch wget
