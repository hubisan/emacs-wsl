$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue
if ($vcxsrv) {
    Write-Host (`
    "VcXsrv is already running.`n`n" `
    + "VcXsrv has to be run after adding the firewall rule.`n" `
    + "Please terminate VcXsrv and run the script again.`n`n" `
    + "Press any key to exit...")
    [void][System.Console]::ReadKey($true)
    exit 1
}

Write-Host "`nAdding the firewall rule"
& .\wsl-2_2-firewall-rule.ps1

Write-Host "`nStarting VcXsrv"
& .\wsl-2_3-vcxsrv.ps1

Write-Host "`nLaunching Emacs"
& .\wsl-2_4-emacs.ps1