# Install-Module -Name BlueBirdPS -Scope CurrentUser
# Set-TwitterAuthentication
# Powershell 7 is a must


foreach($line in Get-Content .\countries.txt) {
    if($line -match $regex){
        Publish-Tweet -TweetText "Fuck" $line
        Start-Sleep -Seconds 2
    }
}
