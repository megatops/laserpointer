# How To Build

1. Install `ps2exe` module:

   ```powershell
   Register-PSRepository -Default
   Install-Module ps2exe
   ```

2. Compile the script to Windows exe:

   ```powershell
   powershell.exe -ExecutionPolicy Bypass
   
   ps2exe .\LaserPointer.ps1 .\LaserPointer.exe -noConsole -x64 -title "Laser Pointer" -description "Toggles Windows mouse cursors between the default set and a laser pointer." -company "Megatops Software." -product "Laser Pointer" -copyright "Copyright (C) 2026 Ding Zhaojie <zhaojie_ding@msn.com>" -version "0.0.1" -icon .\LaserPointer.ico
   ```
