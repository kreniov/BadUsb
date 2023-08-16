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
# Получение температуры процессора (требует сторонних инструментов)
$temperature = Get-WmiObject -Namespace "root\cimv2" -Class Win32_TemperatureProbe | Select-Object -ExpandProperty CurrentReading
Write-Host "Temperatura processora: $temperature °C"

# Последние подключения USB
$usbDevices = Get-WmiObject Win32_PnPEntity | Where-Object { $_.PNPClass -eq "USB" }
$usbDevices | ForEach-Object {
    $usbName = $_.Name
    Write-Host "Connect USB: $usbName"
}
