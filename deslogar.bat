
@echo off
net session >nul 2>nul
if %errorlevel% neq 0 (
    echo Erro: Este script requer privilegios de administrador.
    echo Por favor, execute o script como administrador.
    pause
    exit /b 1
) else (
    echo Script executado como administrador.
    rem Coloque aqui o restante do seu script

taskkill /f /im FiveM.exe
taskkill /f /im steam.exe
taskkill /f /im EpicGamesLauncher.exe
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\nui-storage"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache-priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\crashes"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\logs"
rmdir /s /q "%LocalAppData%\DigitalEntitlements"
rmdir /s /q "%AppData%\CitizenFX\kvs"
rmdir /s /q "C:\Users\ADMINI~1\AppData\Local\Temp"
rmdir /s /q "C:\Windows\temp"
mkdir C:\Windows\temp
rmdir /s /q "C:\Windows\Prefetch"
mkdir C:\Windows\Prefetch
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography" /v MachineGuid /f
)
msg * Sucesso!