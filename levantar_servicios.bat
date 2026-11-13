@echo off
cd /d "%~dp0"
echo ===== Iniciando %date% %time% ===== > levantar_log.txt
where docker >> levantar_log.txt 2>&1
if errorlevel 1 (
  echo ERROR: Docker no esta instalado o no esta en el PATH >> levantar_log.txt
  echo ERROR: Docker no esta instalado. Instala Docker Desktop.
  pause
  exit /b 1
)
docker info >nul 2>&1
if errorlevel 1 (
  echo Docker Desktop no esta corriendo, intentando abrirlo... >> levantar_log.txt
  start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
  echo Esperando a que Docker arranque...
  :espera
  timeout /t 5 /nobreak >nul
  docker info >nul 2>&1
  if errorlevel 1 goto espera
)
echo Docker listo >> levantar_log.txt
docker compose up -d --build >> levantar_log.txt 2>&1
docker compose ps >> levantar_log.txt 2>&1
echo ===== FIN ===== >> levantar_log.txt
type levantar_log.txt
echo.
echo Servicios:
echo   Backend:  http://localhost:8080/api/v1/zonas/
echo   Modelo ML: http://localhost:8000/docs
echo   RabbitMQ: http://localhost:15672  (guest/guest)
pause
