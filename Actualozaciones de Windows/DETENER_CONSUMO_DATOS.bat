@echo off
:: Script para DETENER CONSUMO - V6 INTERACTIVO
title DETENER CONSUMO DE DATOS (CONTROL TOTAL)
color 4F
echo ========================================================
echo     MENU DE BLOQUEO DE DATOS
echo ========================================================
echo.

:: --- BLOQUE 1: WINDOWS UPDATE ---
:WUPDATE
set "c1="
set /p c1="[1/3] Bloquear WINDOWS UPDATE y BITS (Vital)? [S/n]: "
if /i "%c1%"=="n" goto EDGE
if /i "%c1%"=="no" goto EDGE

echo    - Deteniendo Windows Update...
net stop wuauserv /y >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1
echo    - Deteniendo BITS...
net stop bits /y >nul 2>&1
sc config bits start= disabled >nul 2>&1
echo    - Bloqueando Optimizacion de Entrega...
net stop dosvc /y >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
echo    [OK] Nucleo de Windows silenciado.
echo.

:: --- BLOQUE 2: EDGE ---
:EDGE
set "c2="
set /p c2="[2/3] Bloquear actualizaciones de EDGE? [S/n]: "
if /i "%c2%"=="n" goto ACER
if /i "%c2%"=="no" goto ACER

echo    - Deteniendo Edge Update...
net stop edgeupdate /y >nul 2>&1
sc config edgeupdate start= disabled >nul 2>&1
net stop edgeupdatem /y >nul 2>&1
sc config edgeupdatem start= disabled >nul 2>&1
echo    [OK] Edge silenciado.
echo.

:: --- BLOQUE 3: ACER ---
:ACER
set "c3="
set /p c3="[3/3] Bloquear actualizaciones de ACER (Care Center)? [S/n]: "
if /i "%c3%"=="n" goto END
if /i "%c3%"=="no" goto END

echo    - Deteniendo Agentes Acer...
net stop AcerCCAgentSvis /y >nul 2>&1
sc config AcerCCAgentSvis start= disabled >nul 2>&1
net stop AcerQAAgentSvis /y >nul 2>&1
sc config AcerQAAgentSvis start= disabled >nul 2>&1
net stop AcerEZSvc /y >nul 2>&1
sc config AcerEZSvc start= disabled >nul 2>&1
echo    [OK] Acer silenciado.
echo.

:END
echo ========================================================
echo  [FIN] Proceso completado segun tus elecciones.
echo ========================================================
pause
exit
