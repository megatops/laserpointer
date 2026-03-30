# Laser Pointer
#
# Toggles Windows mouse cursors between the default set and a laser pointer.
#
# Copyright (C) 2026 Ding Zhaojie <zhaojie_ding@msn.com>
#
# Released under the MIT License.
# See the LICENSE file for details.

$exe = [Environment]::GetCommandLineArgs()[0]
$dir = Split-Path -Parent $exe
$cursor = Join-Path $dir "LaserPointer.cur"
if (-not (Test-Path $cursor)) { exit }

$reg = "HKCU:\Control Panel\Cursors"
$bak = "HKCU:\Software\Megatops Software\LaserPointer\Backup"
$roles = "Arrow","Hand","Help","Wait","AppStarting"

# Ensure backup exists
if (-not (Test-Path $bak)) {
    New-Item $bak -Force | Out-Null
    $p = Get-ItemProperty $reg
    foreach ($r in $roles) { Set-ItemProperty $bak $r $p.$r }
}

# Toggle
$current = (Get-ItemProperty $reg -Name Arrow).Arrow
if ($current -eq $cursor) {
    $p = Get-ItemProperty $bak
    foreach ($r in $roles) { Set-ItemProperty $reg $r $p.$r }
}
else {
    foreach ($r in $roles) { Set-ItemProperty $reg $r $cursor }
}

# Refresh cursor
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class N {
    [DllImport("user32.dll")]
    public static extern bool SystemParametersInfo(int a, int b, string c, int d);
}
"@
[N]::SystemParametersInfo(0x57, 0, $null, 0x02) | Out-Null
