@echo off
setlocal enabledelayedexpansion

:: Verificar que se pasó un parámetro
if "%~1"=="" (
    echo Uso: %0 archivo.envs.prd
    exit /b 1
)

set "envFile=%~1"

if not exist "%envFile%" (
    echo Error: El archivo "%envFile%" no existe.
    exit /b 1
)

:: Obtener el repositorio actual (owner/repo) usando gh CLI
for /f "usebackq delims=" %%a in (`gh repo view --json nameWithOwner -q ".nameWithOwner"`) do (
    set "repo=%%a"
)
if "%repo%"=="" (
    echo Error: No se pudo determinar el repositorio actual.
    exit /b 1
)

:: Obtener la rama actual usando git
for /f "usebackq delims=" %%a in (`git rev-parse --abbrev-ref HEAD`) do (
    set "branch=%%a"
)
if "%branch%"=="" (
    echo Error: No se pudo obtener la rama actual.
    exit /b 1
)

echo Configurando variables y secretos en el repositorio: %repo% (rama: %branch%)
echo -------------------------------------------------------------

for /f "usebackq tokens=* delims=" %%L in ("%envFile%") do (
    set "line=%%L"
    :: Si la línea no está vacía
    if not "!line!"=="" (
        echo aca
        :: Si la línea comienza con "#" la omite
        echo !line! | findstr /b "#" >nul
        if errorlevel 1 (
            :: Procesa líneas que comienzan con SECRET. o VAR.
            echo !line! | findstr /b "SECRET." >nul
            if not errorlevel 1 (
                :: Es un secret.
                for /f "tokens=1,* delims==" %%I in ("!line!") do (
                    set "left=%%I"
                    set "right=%%J"
                )
                for /f "tokens=1,2 delims=." %%K in ("!left!") do (
                    set "type=%%K"
                    set "name=%%L"
                )
                if /i "!type!"=="SECRET" (
                    echo Estableciendo SECRET: !name!
                    echo !right! | gh secret set !name! --repo %repo%
                )
            ) else (
                echo !line! | findstr /b "VAR." >nul
                if not errorlevel 1 (
                    for /f "tokens=1,* delims==" %%I in ("!line!") do (
                        set "left=%%I"
                        set "right=%%J"
                    )
                    for /f "tokens=1,2 delims=." %%K in ("!left!") do (
                        set "type=%%K"
                        set "name=%%L"
                    )
                    if /i "!type!"=="VAR" (
                        echo Estableciendo VAR: !name!
                        gh variable set !name! --body "!right!" --repo %repo%
                    )
                ) else (
                    echo Línea no válida (se omite)
                )
            )
        )
    )
)

echo Proceso completado!
endlocal
