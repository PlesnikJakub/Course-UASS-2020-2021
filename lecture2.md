# Lecture 2 - EN

## Task
- Your goal is to install required software on your computers as a requirement for next lectures.

# Lecture 2 - CZ

## Úkol
- Vaším ukolem pro toto cvičení je nainstalovat si potřebné prostředí pro další výuku. 


## Instalation Guide
### Gephi
* https://gephi.org/users/
* https://github.com/gephi/gephi/wiki/Datasets
* https://gephi.org/tutorials/gephi-tutorial-quick_start.pdf
* Instalace – možný problém s cestou k Javě (řešení lze najít zde https://github.com/gephi/gephi/issues/1787 ) - úprava conf souboru:
  1. After you installed Java, find the main folder where the java is installed. for example mine is "C:\Program Files\Java\jre-10" and includes bin, conf, legal and lib folders.
  1. Install Gephi, and go to etc folder, "C:\Program Files\Gephi-0.9.2\etc".
  1. open notepad, drop gefi.conf into notepad
  1. look for the line, begins with jdkhome=
  1. if there is a # before the jdkhome, remove the #
  1. Add the address of Java folder after the jdkhome=, for example: jdkhome="C:\Program Files\Java\jre-10"
  1. save the file in notepad
  1. run gefi, it should work

### R
1. https://www.rstudio.com/
2. https://www.r-project.org/
3. https://kateto.net/wp-content/uploads/2016/01/NetSciX_2016_Workshop.pdf
