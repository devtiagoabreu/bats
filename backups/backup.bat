cls
echo off
cls
REM -
REM - 100SECURITY
REM - 
REM - Criado por: Tiago de Abreu
REM - 
REM -
REM - VARIAVEIS
set "dateStamp=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%"
set ORIGEM=C:\xampp
set DESTINO="C:\bkp_server_ti\%dateStamp%"
set LOG=C:\bkp_server_ti\LOG
set EMAIL=devstackpro@gmail.com
REM - ESTRUTURA
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #         COPIA DE ARQUIVOS E/OU DIRETORIOS         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
xcopy %ORIGEM% %DESTINO% /E /Y /C /H
REM /E - Copia diretórios e subdiretórios, inclusive os vazios.
REM /Y - Suprime o prompt para você confirmar se deseja substituir um arquivo de destino existente.
REM /C - Continua copiando, mesmo que ocorram erros.
REM /H - Copia arquivos ocultos e do sistema também.
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo # GERANDO LOG DE ARQUIVOS E/OU DIRETORIOS COPIADOS  #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
dir /s %DESTINO% > %LOG%\Arquivos.txt
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
echo #          ENVIANDO E-MAIL COM LOG EM ANEXO         #
echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
REM blat.exe -attach "C:\bkp_server_ti\LOG\Arquivos.txt" -p configsmtp -to %EMAIL% -subject BACKUP -body "O backup foi realizado com sucesso!" -server 192.168.1.200:25 -f %EMAIL%