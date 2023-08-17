$Title = @"
██████╗░██╗░░██╗███████╗███████╗░█████╗░
╚════██╗██║░░██║██╔════╝██╔════╝██╔══██╗
░█████╔╝███████║█████╗░░█████╗░░██║░░██║
░╚═══██╗╚════██║██╔══╝░░██╔══╝░░██║░░██║
██████╔╝░░░░██║███████╗███████╗╚█████╔╝
╚═════╝░░░░░╚═╝╚══════╝╚══════╝░╚════╝░
"@

$AnimationFrames = @(
    "  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮  ",
    "  ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫  ",
    "  ┃                                          ┃  ",
    "  ┃    ░▒▓█ Welcome to the BADUSB Script █▓▒░   ┃  ",
    "  ┃                                          ┃  ",
    "  ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫  ",
    "  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯  "
)

$AnimationDelay = 100
$ClearScreenDelay = 1000

function Show-AnimatedMessage {
    $savedCursorVisibility = $host.UI.RawUI.CursorVisible
    $host.UI.RawUI.CursorVisible = $false

    Clear-Host

    foreach ($frame in $AnimationFrames) {
        Write-Host $frame
        Start-Sleep -Milliseconds $AnimationDelay
        Clear-Host
    }

    $host.UI.RawUI.CursorVisible = $savedCursorVisibility
}

Show-AnimatedMessage

Write-Host ""
Write-Host $Title
