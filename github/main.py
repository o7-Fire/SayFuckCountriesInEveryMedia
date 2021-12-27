import github
import time

g = github.Github("token")
repo = g.get_repo("org_name/repo_name")

countries = open("countries.txt", "r").read().split("\n")
while True:
	for country in countries:
		finalmessage = f"Fuck {country}"
		file = repo.get_contents("README.md", ref="main")
		repo.update_file(file.path, finalmessage, finalmessage, file.sha)
		time.sleep(5)
