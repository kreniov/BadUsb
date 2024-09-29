# Приветственное сообщение
function Show-WelcomeMessage {
    Clear-Host
    $welcomeText = @"
############################################################
#                                                          #
#                  WELCOME, I1YK9N!                        #
#                                                          #
#               SYSTEM ACCESS GRANTED                      #
#                                                          #
############################################################
"@
    Write-Host $welcomeText -ForegroundColor Green
    Start-Sleep -Seconds 3
    Write-Host "Gathering system information..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
}

# Получение базовой информации о системе
function Show-SystemInfo {
    Write-Host "===== System Information =====" -ForegroundColor Cyan
    # Информация о системе
    $os = Get-WmiObject -Class Win32_OperatingSystem
    $cpu = Get-WmiObject -Class Win32_Processor
    $bios = Get-WmiObject -Class Win32_BIOS
    $memory = Get-WmiObject -Class Win32_ComputerSystem

    Write-Host "Operating System: $($os.Caption)" -ForegroundColor White
    Write-Host "Version: $($os.Version)" -ForegroundColor White
    Write-Host "Architecture: $($os.OSArchitecture)" -ForegroundColor White
    Write-Host "Computer Name: $($os.CSName)" -ForegroundColor White
    Write-Host "CPU: $($cpu.Name)" -ForegroundColor White
    Write-Host "BIOS Version: $($bios.SMBIOSBIOSVersion)" -ForegroundColor White
    Write-Host "Total Physical Memory: $([math]::round($memory.TotalPhysicalMemory/1GB,2)) GB" -ForegroundColor White
}

# Запуск приветствия
Show-WelcomeMessage

# Показ базовой информации о системе
Show-SystemInfo

# Ожидание закрытия консоли
Write-Host "`nPress any key to close the window..." -ForegroundColor Red
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
