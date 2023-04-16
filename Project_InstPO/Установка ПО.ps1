# Функция для скачивания файла
function DownloadFile($url, $output)
{
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $output)
}
# Функция для установки приложения
function InstallApp($appName, $installerPath)
{
    $arguments = "/S /D=`"$($env:ProgramFiles)\$($appName)`""
    Start-Process -FilePath $installerPath -ArgumentList $arguments -Wait
}
# Список приложений для установки
$apps = @{
    "Steam" = "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
    "EA" = "https://eaassets-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe"
    "Epic Games Launcher" = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
    "Ubisoft Connect" = "https://ubistatic19-a.akamaihd.net/resource/en-us/game/ubisoftconnect/UplayInstaller.exe"
    "GOG GALAXY" = "https://cdn.gog.com/open/galaxy/client/galaxy_client_2.0.32.3.exe"
    "Opera GX" = "https://get.geo.opera.com/pub/opera_gx/81.0.4196.54/win/Opera_GX_81.0.4196.54_Setup.exe"
    "twinkle Tray" = "ms-windows-store://pdp/?productid=9nblggh4s4s6"
    "Vortex" = "https://download.vortex.gg/Vortex-Setup.exe"
    "Keepass" = "https://sourceforge.net/projects/keepass/files/latest/download"
    "7z" = "https://www.7-zip.org/a/7z2101-x64.exe"
    "AutoLogon" = "https://download.sysinternals.com/files/AutoLogon.zip"
    "Nvidia Geforce RTX 3070 TI Driver" = "https://us.download.nvidia.com/Windows/496.49/496.49-desktop-win11-64bit-international-dch-whql.exe"
    "TaskBarX" = "ms-windows-store://pdp/?productid=9n4wgh0z6vhb"
}
# Переменные для хранения количества скачанных и установленных приложений
$downloadedAppsCount = 0
$installedAppsCount = 0
# Скачивание и установка приложений
foreach ($app in $apps.GetEnumerator()) {
    $appName = $app.Key
    $appUrl = $app.Value
    Write-Output "Скачивание $appName..."
    try {
        $tempFile = [System.IO.Path]::GetTempFileName() + ".exe"
        DownloadFile $appUrl $tempFile
        Write-Output "Установка $appName..."
        InstallApp $appName $tempFile
        $installedAppsCount++
    } catch {
        Write-Output "Не удалось скачать или установить $appName."
    } finally {
        Remove-Item $tempFile -Force
        $downloadedAppsCount++
    }
}
# Вывод информации о количестве установленных и скачанных приложений
Write-Output "Скачано $downloadedAppsCount приложений."
Write-Output "Установлено $installedAppsCount приложений."