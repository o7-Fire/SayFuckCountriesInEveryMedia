import os
from pathlib import Path
from typing import List

readmeFile = Path("README.md")
orig = readmeFile.read_text()
ctx = str(orig)
finishedC = ":heavy_check_mark:"
noneC = ":x:"


def getMediaList() -> List[str]:
    actual = []
    for folder in os.listdir(Path.cwd()):
        # if not start with . and is a directory
        if not folder.startswith('.') and os.path.isdir(folder):
            actual.append(folder)
    return actual


def getLanguageList(folder) -> List[str]:
    langs = []
    for file in os.listdir(folder):
        if os.path.isdir(folder + '/' + file):
            langs.append(file)
    return langs


def getMatrix(folders: List[str]) -> dict:
    matrix = {
        'Media': folders,
    }
    language = set()
    # discover all languages
    for folder in folders:
        langs = getLanguageList(folder)
        language.update(langs)

    language = list(language)
    language.sort()
    for lang in language:
        matrix[lang] = []
        for folder in folders:
            if lang in getLanguageList(folder):
                matrix[lang].append(finishedC)
            else:
                matrix[lang].append(noneC)
    return matrix


def buildTable(matrix: dict) -> str:
    colsWidth = {}
    for col in matrix:
        length = 0
        for row in matrix[col]:
            length = max(length, len(row))
        # length = length + 2  # add 2 for the border at start and end
        colsWidth[col] = length
    # print head
    tableMatrix = "|"
    for col, width in colsWidth.items():
        tableMatrix += " " + col + " " * (width - len(col)) + " |"
    tableMatrix += "\n"
    # print border
    tableMatrix += "|"
    for col, width in colsWidth.items():
        width = width + 2
        tableMatrix += "-" * width + "|"
    tableMatrix += "\n"
    # print body
    rows = 0
    for i in range(len(matrix['Media'])):
        tableMatrix += "|"
        for col, width in colsWidth.items():
            tableMatrix += " " + matrix[col][i] + " " * (width - len(matrix[col][i])) + " |"
        tableMatrix += "\n"
        rows += 1

    return tableMatrix


mat = getMatrix(getMediaList())
table = buildTable(mat)
ctx = ctx.split("<GENERATED>\n")  # this is retarded
ctx[1] = table + "\n" + "</GENERATED>"
ctx = "<GENERATED>\n\n".join(ctx)
if ctx != orig:
    readmeFile.write_text(ctx, 'utf-8')
    print('TABLE GENERATED')
else:
    print("TABLE UP TO DATE")
    exit(0)

if os.getlogin() != "runner":
    print("Not runner, skipping git commit")
    exit(0)

os.system('git add README.md')
os.system('git commit -m "Matrix Update"')
os.system('git push')
