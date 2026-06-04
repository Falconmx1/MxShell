# MxShell - Aliases estilo Kali Linux

# --- Navegación rápida ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# --- Comandos de sistema con sudo (estilo root) ---
alias iptables='sudo iptables'
alias ufw='sudo ufw'
alias systemctl='sudo systemctl'
alias service='sudo service'
alias mount='sudo mount'
alias umount='sudo umount'
alias fdisk='sudo fdisk'
alias mkfs='sudo mkfs'
alias apt='sudo apt'
alias apt-get='sudo apt-get'

# --- Herramientas de red ---
alias listen='sudo nc -lvnp'
alias reverse='bash -i >& /dev/tcp/'
alias scan='sudo nmap -sV -sC -O'
alias fastscan='sudo nmap -T4 -F'
alias fullscan='sudo nmap -p- -sV'
alias sniff='sudo tcpdump -i'
alias netstat='netstat -tulpn'

# --- Herramientas de pentesting ---
alias sqlmap='python3 /usr/share/sqlmap/sqlmap.py'
alias msfconsole='sudo msfconsole'
alias hydra='sudo hydra'
alias john='sudo john'
alias airodump='sudo airodump-ng'
alias aireplay='sudo aireplay-ng'
alias wash='sudo wash'
alias reaver='sudo reaver'

# --- Utilidades del sistema ---
alias update='sudo apt update && sudo apt upgrade -y'
alias cleanup='sudo apt autoremove -y && sudo apt autoclean'
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias diskusage='df -h'
alias folderusage='du -sh * | sort -h'

# --- Procesos ---
alias psa='ps aux'
alias psg='ps aux | grep'
alias kill9='kill -9'

# --- MxShell específicos ---
alias mx-update='cd $HOME/.mxshell && git pull origin main && source $HOME/.zshrc'
alias mx-banner='cat $HOME/.mxshell/banner.txt'
alias mx-root='source $HOME/.mxshell/root-emu.sh'
alias mx-tools='bash $HOME/.mxshell/tools.sh'
alias mx-matrix='bash $HOME/.mxshell/matrix.sh'
alias mx-help='echo "Comandos MxShell: mx-update, mx-banner, mx-root, mx-tools, mx-matrix"'

# --- Seguridad y anonimato ---
alias myip='curl -s ifconfig.me'
alias localip='ip a | grep inet'
alias flushdns='sudo systemd-resolve --flush-caches'
alias vpn='sudo openvpn'
alias proxy='export http_proxy="http://127.0.0.1:8080"; export https_proxy="http://127.0.0.1:8080"'

# --- Editores rápidos ---
alias ezsh='nano ~/.zshrc'
alias ebanner='nano ~/.mxshell/banner.txt'
alias etheme='nano ~/.mxshell/theme.zsh'
alias ealias='nano ~/.mxshell/aliases.zsh'

# --- Recargar configuración ---
alias reload='source ~/.zshrc'

# --- Información del sistema al estilo Kali ---
alias sysinfo='echo "Sistema: $(lsb_release -d | cut -f2)"; echo "Kernel: $(uname -r)"; echo "Uptime: $(uptime -p)"'

# --- Comandos graciosos/épicos ---
alias matrix='cmatrix'
alias hollywood='hollywood'
alias fortune='fortune | cowsay'
