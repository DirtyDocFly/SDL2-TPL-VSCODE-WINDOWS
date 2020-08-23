# Starter Template SDL2 C/C++ pour Visual Studio Code

*Work in progress...*

## Instalation

Cloner le repo github dans le dossier de votre choix sur votre pc.
Ouvrir ce dossier avec Visual Studio Code

Prérequis avant de pouvoir utiliser les taches de compilations et le debuggeur : 
* Installer Mingw
* Installer Visual Studio Code
* Installer l'extension C/C++ de Microsoft dans Visual Studio Code
* Facultatif - Installer l'extension Tasks de actboy168
* Modifier le fichier launch.json : 
  * Renseigner le chemin vers votre installation de mingw "miDebuggerPath" qui est surement différent du mien.

## Compiler et lancer l'application

* Dans le menu : Terminal > Run Task...
  
**ou**

* Ouvrez le panel avec Ctrl+Shift+p puis taper >Tasks:Run tasks
  
**ou si vous avez installer l'extention tasks**

* Cliquer sur la tache de votre choix dans la partie gauche de la barre de status (par defaut en bleu) en bas de la fenetre de Visual Studio Code

<a href="https://imgur.com/ZQxHNLA"><img src="https://i.imgur.com/ZQxHNLA.png" title="source: imgur.com" /></a>

**Puis choisir [Compile & Run] dans la liste**

## Pour aller plus loin

**Il y a 4 taches disponible :**

[Compile] - Compile le projet dans un dossier /bin

[Run] - Lance l'executable sans recompiler (Si aucun executable n'existe alors cette taches lance une compilation)

[Compile & Run] - Compile ou Re-Compile puis lance l'executable

[Clean] - Nettoye le dossier temporaire /bin

**Lancer la commande Run / Start Debugging du menu de Visal Studio Code pour commencer a debugger**

**N'hésitez pas à regarder**

le fichier Makefile.bat pour voir le script

le fichier .vscode/tasks.json pour voir les taches

les fichiers .vscode/launch.json et .vscode/c_cpp_properties.json pour voir les configurations de Visual Studio Code pour le lancement du debuggeur