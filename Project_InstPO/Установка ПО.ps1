# Установка Steam
Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe -OutFile "$env:USERPROFILE\Downloads\SteamSetup.exe"
Start-Process "$env:USERPROFILE\Downloads\SteamSetup.exe" -Args '/silent' -Wait
# Установка EA
Invoke-WebRequest https://www.dm.origin.com/download/Origin/EASetup.exe -OutFile "$env:USERPROFILE\Downloads\EASetup.exe"
Start-Process "$env:USERPROFILE\Downloads\EASetup.exe" -Args '/silent' -Wait
# Установка Epic Games Launcher
Invoke-WebRequest https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi -OutFile "$env:USERPROFILE\Downloads\EpicGamesLauncherInstaller.msi"
Start-Process "msiexec.exe" -Args '/i "$env:USERPROFILE\Downloads\EpicGamesLauncherInstaller.msi" /quiet' -Wait
# Установка Ubisoft Connect
Invoke-WebRequest https://ubistatic19-a.akamaihd.net/resource/en-us/game/ubisoftconnect/UplayInstaller.exe -OutFile "$env:USERPROFILE\Downloads\UplayInstaller.exe"
Start-Process "$env:USERPROFILE\Downloads\UplayInstaller.exe" -Args '/S' -Wait
# Установка GOG GALAXY
Invoke-WebRequest https://cdn.gog.com/open/galaxy/client/galaxy_client_2.0.22.66.exe -OutFile "$env:USERPROFILE\Downloads\galaxy_client_2.0.22.66.exe"
Start-Process "$env:USERPROFILE\Downloads\galaxy_client_2.0.22.66.exe" -Args '/silent' -Wait
# Установка Opera GX
Invoke-WebRequest https://download3.operacdn.com/pub/opera_gx/81.0.4196.69/win/Opera_GX_81.0.4196.69_Setup.exe -OutFile "$env:USERPROFILE\Downloads\Opera_GX_81.0.4196.69_Setup.exe"
Start-Process "$env:USERPROFILE\Downloads\Opera_GX_81.0.4196.69_Setup.exe" -Args '/silent' -Wait