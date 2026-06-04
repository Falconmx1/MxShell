#!/bin/bash

# MxShell - Instalador de herramientas de pentesting

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}    MxShell - Instalador de Herramientas${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Lista de herramientas
tools=(
    "nmap"
    "sqlmap"
    "hydra"
    "john"
    "aircrack-ng"
    "wireshark"
    "burpsuite"
    "gobuster"
    "nikto"
    "metasploit-framework"
)

echo -e "${YELLOW}Herramientas a instalar:${NC}"
for tool in "${tools[@]}"; do
    echo -e "  - $tool"
done

read -p "¿Instalar todas las herramientas? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}[→] Actualizando repositorios...${NC}"
    sudo apt update
    
    for tool in "${tools[@]}"; do
        echo -e "${YELLOW}[→] Instalando $tool...${NC}"
        sudo apt install -y "$tool"
    done
    
    echo -e "${GREEN}[✓] ¡Todas las herramientas instaladas!${NC}"
else
    echo -e "${RED}[✗] Instalación cancelada${NC}"
fi
