$credential = Get-Credential
Invoke-Command -VMName ubuntu -Credential $credential -FilePath "C:\Users\Knut\OneDrive - Osloskolen\2IT\IT\årsoppgave\mariadb userface\get_ip_from_vm.ps1"
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