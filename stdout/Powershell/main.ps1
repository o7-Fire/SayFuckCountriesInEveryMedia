foreach($line in Get-Content .\countries.txt) {
    if($line -match $regex){
        Write-Output "Fuck" + $line
        Start-Sleep -Seconds 2
    }
}
