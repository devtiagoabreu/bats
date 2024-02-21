@echo off


echo on
set ORIGEM="C:\arquivos"
set SAIDA="C:\saida"
set 7zip="c:\Program Files\7-Zip\7z.exe"
for /d %%X in (%ORIGEM%) do %7zip% a -t7z %SAIDA%\%%X.7Z






rem Define a pasta de instalação do 7-Zip
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"

rem Define a pasta a ser compactada e o diretório de backup
set "sourceFolder=C:\xampp"
set "backupFolder=C:\bkp_server_ti"

rem Obtém a data atual no formato YYYYMMDD
set "dateStamp=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"

rem Define o nome do arquivo compactado com base na data atual
set "archiveName=xampp_%dateStamp%.zip"

rem Cria o comando para compactar a pasta XAMPP
set "command="%sevenZipPath%" a -r "%backupFolder%\%archiveName%" "%sourceFolder%""

rem Executa o comando
%command%

rem Verifica se o comando foi executado com sucesso
if %errorlevel% equ 0 (
    echo Pasta XAMPP compactada com sucesso.
) else (
    echo Erro ao compactar a pasta XAMPP.
)