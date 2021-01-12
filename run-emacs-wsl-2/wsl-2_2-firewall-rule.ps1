# WSL2 - Add inbound firewall rule

# Started here and somehow found all I need: https://stackoverflow.com/a/61110604/1365754

# If the current console is not elevated then pass the script to a new elevated powershell process.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs -Wait "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# Add the firewall rule.

Import-Module -Name 'NetSecurity'

$rulename = 'WSL 2 Firewall Unlock'
$programname = 'C:\program files\vcxsrv\vcxsrv.exe'
$localport = 6000

# Get the remote ip.
$remoteip = wsl -d Ubuntu-20.04 bash -c "ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
$remoteipfound = $remoteip -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
if( !$remoteipfound ){
  Write-Output "The Script exited, the remote ip address cannot be found";
  exit;
}

## Get the local ip.
$localip = wsl -d Ubuntu-20.04 bash -c 'ip route | awk ''/default via /'' | cut -d'' '' -f3'
$localipfound = $localip -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
if( !$localipfound ){
  Write-Output "The Script Exited, the local ip address cannot be found";
  exit;
}

## Delete the rule if it exists already.
$rulefound = Get-NetFirewallRule -DisplayName $rulename 2> $null; 
if ($rulefound) { 
  Remove-NetFireWallRule -DisplayName $rulename
} 

## Add the new rule.
New-NetFireWallRule -DisplayName $rulename -Direction Inbound -InterfaceType Wired `
-LocalAddress $localip -RemoteAddress $remoteip -Action Allow `
-Protocol TCP -LocalPort $localport -Program $programname
