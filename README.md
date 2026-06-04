# 🔥 MxShell – La terminal que siempre quisiste tener

**MxShell** es una terminal potente para **Windows y Linux** con la estética y el poder de **Kali Linux**. Incluye ZSH mejorado, banner épico, tema personalizado, alias inteligentes y emulación de terminal root.

![GitHub stars](https://img.shields.io/github/stars/Falconmx1/MxShell)
![GitHub license](https://img.shields.io/github/license/Falconmx1/MxShell)
![GitHub issues](https://img.shields.io/github/issues/Falconmx1/MxShell)

## 🚀 Características

- ✅ **ZSH mejorado** con Oh My ZSH + plugins esenciales
- 🎨 **Tema visual estilo Kali** (prompt con colores y símbolos)
- 📢 **Banner épico** al iniciar la terminal
- 🛠️ **Aliases inteligentes** (herramientas de pentesting)
- 👑 **Emulación de root** (estética y funcionalidad root sin peligro)
- 💻 **Multiplataforma**: Windows (WSL2 / Git Bash) y Linux nativo
- ⚡ **Instalación automática** con scripts

## 📦 Instalación

### 🐧 Linux (Ubuntu/Debian/Kali)

```bash
git clone https://github.com/Falconmx1/MxShell.git
cd MxShell
chmod +x install.sh
./install.sh

🪟 Windows
Opción 1: WSL2 (recomendada)
# Ejecutar como Administrador en PowerShell
git clone https://github.com/Falconmx1/MxShell.git
cd MxShell
powershell -ExecutionPolicy Bypass -File install.ps1

Opción 2: Git Bash
# Desde Git Bash
git clone https://github.com/Falconmx1/MxShell.git
cd MxShell
bash install.sh

🎮 Uso Básico
Una vez instalado, abre una nueva terminal y verás:
┌─[root👽MxShell]─[~]
└─#

Comandos rápidos
Comando	Función
mx-update	Actualiza MxShell
mx-tools	Instala herramientas de pentesting
mx-root	Activa modo root emulado
mx-banner	Muestra el banner otra vez
mx-theme	Cambia el tema (kali/hacker/matrix)

Aliases incluidos
alias iptables='sudo iptables'
alias listen='nc -lvnp'
alias reverse='bash -i >& /dev/tcp/'
alias scan='nmap -sV -sC'
alias msfconsole='sudo msfconsole'
alias sqlmap='python3 sqlmap'

🎨 Personalización
Cambiar banner
Edita ~/.mxshell/banner.txt

Cambiar tema
Edita ~/.zshrc y cambia la variable ZSH_THEME

Agregar alias
Edita ~/.mxshell/aliases.zsh

🛠️ Herramientas incluidas (opcional)
Ejecuta mx-tools para instalar:

nmap, sqlmap, metasploit, hydra, john, wireshark, burpsuite, gobuster
