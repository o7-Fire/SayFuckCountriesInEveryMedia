# Get-Help Set-GitHubAuthentication -Examples
# Install-Module -Name PowerShellForGithub

foreach($line in Get-Content .\countries.txt) {
    if($line -match $regex){
        Set-GitHubContent -OwnerName NAME -RepositoryName REPONAME -Path README.md -CommitMessage "Fuck $line" -Content "Fuck $line" -BranchName master
        Start-Sleep -Seconds 5
    }
}
