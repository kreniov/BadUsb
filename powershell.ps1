[Console]::OutputEncoding = [Text.Encoding]::UTF8

# Отображение имени компьютера
$computerName = $env:COMPUTERNAME
Write-Host "Name PC: $computerName"

# Отображение версии операционной системы
$osVersion = (Get-WmiObject Win32_OperatingSystem).Caption
Write-Host "Version OS: $osVersion"

# Отображение информации о процессоре
$processor = (Get-WmiObject Win32_Processor).Name
Write-Host "Processor: $processor"

# Отображение информации о видеокарте
$videoCard = (Get-WmiObject Win32_VideoController).Name
Write-Host "VideoCard: $videoCard"

# Отображение объема оперативной памяти
$memory = (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Host "Memory OP: $memory GB"

# Отображение объема свободного места на диске C:
$freeSpace = (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB
Write-Host "Free memory disk C: $freeSpace GB"

# Отображение сохраненных паролей Wi-Fi
$wifiProfiles = (netsh wlan show profiles) -match "Все профили пользователей"
$wifiProfiles | ForEach-Object {
    $profileName = $_ -replace "    Все профили пользователей     : ", ""
    $wifiPassword = (netsh wlan show profile name="$profileName" key=clear) -match "Ключ содержит :"
    if ($wifiPassword) {
        $password = $wifiPassword[0] -replace "    Ключ содержит             : ", ""
        Write-Host "Wi-Fi сеть: $profileName, Пароль: $password"
    }
}
