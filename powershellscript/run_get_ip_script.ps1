$credential = Get-Credential

$credential | Export-Clixml -Path "C:\Users\Knut\OneDrive - Osloskolen\2IT\IT\year-task\mariadb userface\powershellscript\secure\credential.xml"
Invoke-Command -VMName ubuntu -Credential $credential -FilePath "C:\Users\Knut\OneDrive - Osloskolen\2IT\IT\year-task\mariadb userface\powershellscript\get_ip_from_vm.ps1"