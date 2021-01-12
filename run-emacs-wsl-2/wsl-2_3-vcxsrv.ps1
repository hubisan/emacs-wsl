# WSL2 - Start VcXsrv

# Stop vcxsrv (if already running it needs to be restarted)
$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue
if ($vcxsrv) {
  Write-Host (`
  "VcXsrv is already running.`n`n" `
  + "Press any key to exit...")
  [void][System.Console]::ReadKey($true)
  exit 1
  # This could be used to stop the process if it is running.
  # $vcxsrvid = $vcxsrv.id
  # Stop-Process -Id $vcxsrvid
  # Wait-Process -Id $vcxsrvid
}

# Start vcxsrv with the flags needed.
& "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -multiwindow -clipboard -wgl -ac