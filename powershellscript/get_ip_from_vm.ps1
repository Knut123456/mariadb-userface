
try {
    ipconfig.exe | Select-String -Pattern "IPv4 Address" -Context 0,1 | ForEach-Object { $_.Context.PostContext -replace ".*:\s*(\d+\.\d+\.\d+\.\d+).*",'$1' }
}
catch {
    try {
        Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -eq "Ethernet" } | Select-Object -ExpandProperty IPAddress
    }
    catch {
        write-host "Error: $_"
    }

}