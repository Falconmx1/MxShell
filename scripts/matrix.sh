#!/bin/bash

# MxShell - Efecto Matrix para el banner

GREEN='\033[0;32m'
DARK_GREEN='\033[0;32m'
NC='\033[0m'

clear

# Mostrar banner con efecto Matrix
for i in {1..50}; do
    echo -ne "${DARK_GREEN}10 01 11 00 01 10 01 11 00 ${GREEN}MxShell${DARK_GREEN} 10 01 11 00 01 10 01 11${NC}\r"
    sleep 0.05
done

echo ""
cat $HOME/.mxshell/banner.txt
echo ""
echo -e "${GREEN}⚡ Sistema preparado para operaciones ⚡${NC}"
