IDENTIFICATION DIVISION.
PROGRAM-ID. FUCK.
ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Ass ASSIGN TO "countries.txt"
       		ORGANIZATION IS LINE SEQUENTIAL,
PROCEDURE DIVISION.
MAIN. 
  DISPLAY 'fuck' + Ass.
  STOP RUN.
