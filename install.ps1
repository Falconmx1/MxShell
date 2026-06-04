# MxShell - Instalador para Windows
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
Write-Host "    MxShell - Terminal Potente v1.0" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue

# Verificar si WSL está instalado
$wslInstalled = (Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux).State -eq "Enabled"

if (-not $wslInstalled) {
    Write-Host "[→] Instalando WSL2..." -ForegroundColor Yellow
    wsl --install
    Write-Host "[!] Reinicia tu PC después de la instalación" -ForegroundColor Red
    exit
}

# Instalar Ubuntu si no está
$ubuntuInstalled = wsl -l -v | Select-String "Ubuntu"
if (-not $ubuntuInstalled) {
    Write-Host "[→] Instalando Ubuntu en WSL..." -ForegroundColor Yellow
    wsl --install -d Ubuntu
}

# Ejecutar script de Linux dentro de WSL
Write-Host "[→] Ejecutando instalador de Linux en WSL..." -ForegroundColor Yellow
wsl bash -c "git clone https://github.com/Falconmx1/MxShell.git && cd MxShell && chmod +x install.sh && ./install.sh"

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
Write-Host "[✓] ¡Instalación completada!" -ForegroundColor Green
Write-Host "[!] Abre WSL y ejecuta: source ~/.zshrc" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Green
