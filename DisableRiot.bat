@echo off

echo Current user privileges: %userprofile%
echo.
echo Requesting administrative privileges...

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :continue
) else (
    goto :admin
)

:admin
echo.
echo You need to run this batch file as an Administrator.
echo Please grant administrative privileges by selecting "Yes" when prompted.
echo.
powershell -Command "Start-Process '%0' -Verb RunAs"
exit

:continue
echo Administrative privileges confirmed.
echo.
echo Disabling Riot Vanguard...

sc stop vgk

echo.
echo Done!
echo.
pause>nul
exit
