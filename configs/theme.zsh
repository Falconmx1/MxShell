# MxShell - Tema personalizado tipo Kali

# Colores personalizados
typeset -A color
color=(
    [reset]="%{$reset_color%}"
    [red]="%{$fg[red]%}"
    [green]="%{$fg[green]%}"
    [yellow]="%{$fg[yellow]%}"
    [blue]="%{$fg[blue]%}"
    [magenta]="%{$fg[magenta]%}"
    [cyan]="%{$fg[cyan]%}"
    [white]="%{$fg[white]%}"
)

# Función para el prompt izquierdo
set_prompt() {
    # Usuario y host
    USER_HOST="${color[green]}%n${color[reset]}@${color[blue]}%m${color[reset]}"
    
    # Directorio actual (acortado)
    DIR="${color[yellow]}%~${color[reset]}"
    
    # Rama de git (si existe)
    if git rev-parse --git-dir >/dev/null 2>&1; then
        GIT_BRANCH=" ${color[red]}($(git branch --show-current))${color[reset]}"
    else
        GIT_BRANCH=""
    fi
    
    # Estado de root emulado
    if [ -f "$HOME/.mxshell/root_mode" ]; then
        ROOT_MODE="${color[red]}👑 ROOT${color[reset]}"
        PROMPT_SYMBOL="${color[red]}➜${color[reset]}"
    else
        ROOT_MODE="${color[green]}🐧 USER${color[reset]}"
        PROMPT_SYMBOL="${color[green]}➜${color[reset]}"
    fi
    
    # Construir prompt de una línea
    PROMPT="${color[red]}┌─[${USER_HOST}]─[${DIR}]${GIT_BRANCH} ${ROOT_MODE}
${color[red]}└─${PROMPT_SYMBOL} "
}

# Configurar precmd para actualizar el prompt
precmd() {
    set_prompt
}

# Prompt derecho (opcional)
RPROMPT="%F{cyan}%T%f"

# Título de la terminal
set_term_title() {
    echo -ne "\033]0;MxShell - ${PWD/#$HOME/~}\007"
}
precmd_functions+=(set_term_title)
