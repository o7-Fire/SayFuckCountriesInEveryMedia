Import-Module PSDiscord # Install-Module PSDiscord

$WeebhookUrl = $Env:WEEBHOOK

foreach($line in Get-Content .\countries.txt) {
    if($line -match $regex){
        Send-DiscordMessage -WebHookUrl $WeebhookUrl -Content "Fuck $line" -AvatarName "Fuck $line"
        Start-Sleep -Seconds 2
    }
}
