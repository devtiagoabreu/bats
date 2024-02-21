@echo off

rem Verifica se o Chocolatey está instalado
choco -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Chocolatey não está instalado. Instalando Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    if %errorlevel% neq 0 (
        echo Falha ao instalar Chocolatey. Verifique a conexão com a Internet e tente novamente.
        exit /b %errorlevel%
    )
    echo Chocolatey instalado com sucesso.
)

rem Instala o 7-Zip usando Chocolatey
choco install -y 7zip

if %errorlevel% equ 0 (
    echo 7-Zip instalado com sucesso.
) else (
    echo Falha ao instalar o 7-Zip.
)