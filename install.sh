#!/bin/bash

# MxShell - Instalador para Linux
# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}    MxShell - Terminal Potente v1.0${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Verificar SO
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${GREEN}[✓] Sistema Linux detectado${NC}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${YELLOW}[!] macOS detectado, puede funcionar con ajustes${NC}"
else
    echo -e "${RED}[✗] Sistema no soportado${NC}"
    exit 1
fi

# Instalar ZSH si no existe
echo -e "${YELLOW}[→] Verificando ZSH...${NC}"
if ! command -v zsh &> /dev/null; then
    echo -e "${YELLOW}[→] Instalando ZSH...${NC}"
    sudo apt update
    sudo apt install -y zsh
else
    echo -e "${GREEN}[✓] ZSH ya instalado${NC}"
fi

# Cambiar shell por defecto a ZSH
echo -e "${YELLOW}[→] Cambiando shell por defecto a ZSH...${NC}"
chsh -s $(which zsh)

# Instalar Oh My ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}[→] Instalando Oh My ZSH...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}[✓] Oh My ZSH ya instalado${NC}"
fi

# Instalar plugins
echo -e "${YELLOW}[→] Instalando plugins...${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Crear directorio de configuración de MxShell
echo -e "${YELLOW}[→] Configurando MxShell...${NC}"
mkdir -p $HOME/.mxshell

# Copiar archivos de configuración
cp configs/zshrc $HOME/.zshrc
cp configs/banner.txt $HOME/.mxshell/banner.txt
cp configs/theme.zsh $HOME/.mxshell/theme.zsh
cp configs/aliases.zsh $HOME/.mxshell/aliases.zsh
cp scripts/root-emu.sh $HOME/.mxshell/root-emu.sh
cp scripts/tools.sh $HOME/.mxshell/tools.sh
cp scripts/matrix.sh $HOME/.mxshell/matrix.sh

# Hacer scripts ejecutables
chmod +x $HOME/.mxshell/*.sh

# Agregar MxShell commands al PATH
echo -e "${YELLOW}[→] Agregando comandos MxShell...${NC}"
echo 'export PATH="$HOME/.mxshell:$PATH"' >> $HOME/.zshrc
echo 'alias mx-update="cd $HOME/.mxshell && git pull origin main && source $HOME/.zshrc"' >> $HOME/.zshrc
echo 'alias mx-banner="cat $HOME/.mxshell/banner.txt"' >> $HOME/.zshrc
echo 'alias mx-root="source $HOME/.mxshell/root-emu.sh"' >> $HOME/.zshrc
echo 'alias mx-tools="bash $HOME/.mxshell/tools.sh"' >> $HOME/.zshrc

# Configurar banner en .zshrc
echo '' >> $HOME/.zshrc
echo '# MxShell Banner' >> $HOME/.zshrc
echo 'cat $HOME/.mxshell/banner.txt' >> $HOME/.zshrc

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[✓] ¡Instalación completada!${NC}"
echo -e "${YELLOW}[!] Reinicia tu terminal o ejecuta: source ~/.zshrc${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
