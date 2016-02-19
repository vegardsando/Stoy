## Oppstart
Bedre terminal: [ZSH](http://www.maclife.com/article/columns/terminal_101_better_shell_zsh)
```
#!terminal
curl -L github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

Installer [Homebrew](http://brew.sh/)
```
#!terminal
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
```
Installer [Node](https://nodejs.org)
```
#!terminal
brew install node
```
Installer [gulp](http://gulpjs.com/) globalt
```
#!terminal
npm install -g gulp
```
## Prosjekt start

1. Clone dette repositoriet her: https://bitbucket.org/repo/import med URL fra samme url som steg 4
2. Kopier clone-link
3. Åpne terminal og gå til rett mappe (eks: cd GitHub/mustasj/)
4. Kjør git clone (eks: git clone https://peirix@bitbucket.org/mustasj/mustasj.no.git)
5. Kjør **npm install** der package.json ligger
6. Opprett ny database i Sequel Pro (kundenavn_craft)
7. Sett inn databasenavnet i {/craft/config/db.php}
8. Sett opp MAMP Pro til www-mappen (domenet MÅ slutte på .dev om ikke db.php eksisterer i /craft/config/local)
9. Gå inn på /admin og logg inn med mustasj og vanlig passord
10. Endre nettstedsnavn på Generelle instillinger (/admin/settings/general)
11. Kjør gulp ved å skrive **gulp** i terminal