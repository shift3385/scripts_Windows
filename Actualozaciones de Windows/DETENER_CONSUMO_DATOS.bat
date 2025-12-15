@echo off
:: Script para DETENER CONSUMO (Bloquea actualizaciones) - V2 REFORZADO
title DETENER CONSUMO DE DATOS (MODO FUERTE)
color 4F
echo ========================================================
echo     DETENIENDO SERVICIOS PARA AHORRAR DATOS
echo ========================================================
echo.

echo 1. Deteniendo Windows Update...
net stop wuauserv /y
sc config wuauserv start= disabled

echo 2. Deteniendo Transferencia en Segundo Plano (BITS)...
net stop bits /y
sc config bits start= disabled

echo 3. Deteniendo Optimizacion de Entrega (Metodo Registro)...
net stop dosvc /y
:: Usamos REG ADD porque SC CONFIG suele fallar con DoSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 4 /f

echo.
echo ========================================================
echo  [LISTO] El consumo silencioso ha sido DETENIDO.
echo  Tus datos estan seguros.
echo ========================================================
pause
