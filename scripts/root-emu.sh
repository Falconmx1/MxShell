#!/bin/bash

# MxShell - Emulador de root (estilo Kali)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Crear archivo de estado
ROOT_FLAG="$HOME/.mxshell/root_mode"

if [ -f "$ROOT_FLAG" ]; then
    # Modo root actualmente activo - desactivar
    rm -f "$ROOT_FLAG"
    echo -e "${YELLOW}👤 Modo root emulado DESACTIVADO${NC}"
    echo -e "${GREEN}Volviendo a modo usuario estándar${NC}"
    
    # Cambiar prompt en .zshrc temporalmente (se restaura al recargar)
    sed -i 's/└─#/└─$/g' ~/.zshrc
else
    # Activar modo root
    touch "$ROOT_FLAG"
    echo -e "${RED}👑 Modo root emulado ACTIVADO${NC}"
    echo -e "${YELLOW}⚠️  No eres root realmente, solo es estético y práctico${NC}"
    echo -e "${YELLOW}⚠️  Los comandos con sudo seguirán pidiendo contraseña${NC}"
    
    # Cambiar prompt a estilo root (#)
    sed -i 's/└─$/└─#/g' ~/.zshrc
fi

# Recargar ZSH
source ~/.zshrc
echo -e "${BLUE}✅ Configuración aplicada. Reinicia la terminal si no ves cambios.${NC}"
