require 'octokit.rb'

client = Octokit::Client.new(:login => 'GITHUBNAME', :personal_access_token => 'personal_access_token')

File.readlines('countries.txt').each do |line|
  Octokit.create_contents("NAME/REPO", "README.md", line, line, :branch => "master")
  sleep(1)
end
