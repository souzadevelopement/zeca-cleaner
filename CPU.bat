@echo off
setlocal enabledelayedexpansion

set "target_guid={50127dc3-0f36-415e-a6cc-4cb3be910b65}"

set "description="
set "found="

for /f "tokens=*" %%A in ('pnputil /enum-devices /connected') do (
    set "line=%%A"

    if not "!line:Device Description:=!"=="!line!" (
        set "description=!line:*Device Description:=!"
    )

    if not "!line:%target_guid%=!"=="!line!" (
        set "found=1"
        goto :after_loop
    )
)

:after_loop

if not defined found (
    endlocal
    exit /b 1
)

whoami /groups | find "S-1-5-32-544" >nul
if %ERRORLEVEL% NEQ 0 (
    endlocal
    exit /b 1
)

reg add "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString /t REG_SZ /d "%description%" /f >nul 2>&1

if %errorlevel% equ 0 (
    echo successfully! 
) else (
    echo Failed *_*
)

pause
endlocal
exit
