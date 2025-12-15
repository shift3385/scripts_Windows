@echo off
:: Script para PERMITIR actualizaciones - V2 CORREGIDO
title PERMITIR ACTUALIZACIONES (MODO FUERTE)
color 2F
echo ========================================================
echo     PERMITIENDO ACTUALIZACIONES DE WINDOWS
echo ========================================================
echo.
echo 1. Configurando servicios...
sc config wuauserv start= auto
sc config bits start= auto

echo    Restaurando Optimizacion de Entrega (Metodo Registro)...
:: Usamos REG ADD para revertir el bloqueo fuerte del paso anterior
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 2 /f

echo.
echo 2. Iniciando servicios...
net start wuauserv
net start bits
net start dosvc

echo.
echo ========================================================
echo  [LISTO] Windows comenzara a descargar actualizaciones.
echo ========================================================
pause
