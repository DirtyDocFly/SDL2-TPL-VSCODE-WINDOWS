# Starter Template SDL2 C/C++ pour Visual Studio Code - Pour Windows

*Work in progress...*

## __Installation__

Cloner le repo github dans le dossier de votre choix sur votre pc.
Ouvrir ce dossier avec Visual Studio Code

Prérequis avant de pouvoir utiliser les taches de compilations et le debuggeur : 
* Installer mingw-w64 avec [MSYS2](https://github.com/msys2/msys2-installer/releases/download/2022-01-18/msys2-x86_64-20220118.exe) (plus d'information sur la doc de VSCode https://code.visualstudio.com/docs/cpp/config-mingw)
* Installer la SDL2 avec MSYS2 : ``pacman -S mingw-w64-x86_64-SDL2``
* Installer [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
* Installer l'[extension C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) de Microsoft dans Visual Studio Code
* __Facultatif__ - Installer l'extension [Tasks](https://marketplace.visualstudio.com/items?itemName=actboy168.tasks) de [actboy168](https://marketplace.visualstudio.com/publishers/actboy168)
* Modifier le fichier _launch.json_ : 
  * Renseigner le chemin vers votre installation de MSYS2 "__miDebuggerPath__" si besoin.
* Modifier le fichier _c_cpp_properties.json_ : 
  * Renseigner le chemin vers votre installation de MSYS2 "__compilerPath__" si besoin.

## __Compiler et lancer l'application__

* Dans le menu : Terminal > Run Task...
  
**ou**

* Ouvrez le panel avec Ctrl+Shift+p puis taper >Tasks:Run tasks
  
**ou si vous avez installé l'extention tasks**

* Cliquer sur la tache de votre choix dans la partie gauche de la barre de status (par defaut en bleu) en bas de la fenetre de Visual Studio Code

<a href="https://imgur.com/ZQxHNLA"><img src="https://i.imgur.com/ZQxHNLA.png" title="source: imgur.com" /></a>

**Puis choisir [Compile & Run] dans la liste**

## __Pour aller plus loin__

**Il y a 4 taches disponibles :**

__[Compile]__ - Compile le projet dans un dossier /bin

__[Run]__ - Lance l'executable sans recompiler (Si aucun executable n'existe alors cette taches lance une compilation)

__[Compile & Run]__ - Compile ou Re-Compile puis lance l'executable

__[Clean]__ - Nettoye le dossier temporaire /bin

## __Debugger__

**Lancer la commande Run / Start Debugging du menu de Visal Studio Code pour commencer a debugger** (Ne fonctionne pas actuellement, en cours de correction)

**__N'hésitez pas à regarder__**

le fichier Makefile.bat pour voir le script

le fichier .vscode/tasks.json pour voir les taches

les fichiers .vscode/launch.json et .vscode/c_cpp_properties.json pour voir les configurations de Visual Studio Code pour le lancement du debuggeur