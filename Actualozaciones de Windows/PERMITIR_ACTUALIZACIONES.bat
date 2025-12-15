@echo off
:: Script para PERMITIR actualizaciones - V6 INTERACTIVO
title PERMITIR ACTUALIZACIONES (CONTROL TOTAL)
color 2F
echo ========================================================
echo     MENU DE DESBLOQUEO DE DATOS
echo ========================================================
echo.

:: --- BLOQUE 1: WINDOWS UPDATE ---
:WUPDATE
set "c1="
set /p c1="[1/3] Permitir WINDOWS UPDATE y BITS? [S/n]: "
if /i "%c1%"=="n" goto EDGE
if /i "%c1%"=="no" goto EDGE

echo    - Restaurando Windows Update y BITS...
sc config wuauserv start= auto >nul 2>&1
sc config bits start= auto >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v Start /t REG_DWORD /d 2 /f >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
net start dosvc >nul 2>&1
echo    [OK] Windows Update activo.
echo.

:: --- BLOQUE 2: EDGE ---
:EDGE
set "c2="
set /p c2="[2/3] Permitir actualizaciones de EDGE? [S/n]: "
if /i "%c2%"=="n" goto ACER
if /i "%c2%"=="no" goto ACER

echo    - Restaurando Edge Update...
sc config edgeupdate start= demand >nul 2>&1
sc config edgeupdatem start= demand >nul 2>&1
echo    [OK] Edge activo (Manual).
echo.

:: --- BLOQUE 3: ACER ---
:ACER
set "c3="
set /p c3="[3/3] Permitir actualizaciones de ACER? [S/n]: "
if /i "%c3%"=="n" goto END
if /i "%c3%"=="no" goto END

echo    - Restaurando Agentes Acer...
sc config AcerCCAgentSvis start= auto >nul 2>&1
sc config AcerQAAgentSvis start= auto >nul 2>&1
sc config AcerEZSvc start= auto >nul 2>&1
net start AcerCCAgentSvis >nul 2>&1
echo    [OK] Acer activo.
echo.

:END
echo ========================================================
echo  [FIN] Configuracion aplicada.
echo ========================================================
pause
exit
