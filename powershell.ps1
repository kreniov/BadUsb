# Отображение имени компьютера
$computerName = $env:COMPUTERNAME
Write-Host "Имя компьютера: $computerName"

# Отображение версии операционной системы
$osVersion = (Get-WmiObject Win32_OperatingSystem).Caption
Write-Host "Версия операционной системы: $osVersion"

# Отображение информации о процессоре
$processor = (Get-WmiObject Win32_Processor).Name
Write-Host "Процессор: $processor"

# Отображение объема оперативной памяти
$memory = (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Host "Объем оперативной памяти: $memory GB"

# Отображение объема свободного места на диске C:
$freeSpace = (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB
Write-Host "Свободное место на диске C: $freeSpace GB"
