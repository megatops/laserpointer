# How To Build

1. Install `ps2exe` module:

   ```powershell
   Register-PSRepository -Default
   Install-Module ps2exe
   ```

2. Compile the script to Windows exe:

   ```powershell
   powershell.exe -ExecutionPolicy Bypass
   ps2exe .\LaserPointer.ps1 .\LaserPointer.exe -noConsole -icon .\LaserPointer.ico
   ```
