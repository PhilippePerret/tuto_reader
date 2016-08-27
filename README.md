# Tuto-Reader (lecteur de Tutoriel)

Petit programme pour faciliter la création de tutoriels construits.

## Utilisation

* Faire un alias du programme courant pour pouvoir l'utiliser simplement en console (p.e. dans le `~/.bash_profile`):

      alias tuto="/path/to/run.rb"

* Faire un script de tutoriel définissant le plan, les textes à dire et les actions à accomplir dans un fichier de texte simple :

      INTRODUCTION
        Présentation du projet
          DIRE: Ce tutoriel présente l'utilisation de Tuto-Reader, un
          lecteur de scénario de tutoriel.
          FAIRE: Créer un fichier texte dans Atom.
          DIRE: On écrit le script dans un fichier de texte simple, en
          utilisant les imbrications pour créer la hiérarchie.
          DIRE: Dans Atom, on peut utiliser le “folding” pour ouvrir
          et fermer chaque section.
          ...

* Utiliser la commande pour obtenir de l'aide :

      > tuto --help

* Utiliser la commande pour construire le reader :

      > cd ~/path/to/mon/tutoriel
      > tuto mon_script_du_tutoriel
      # => construit le reader et l'ouvre dans Firefox

* Se servir du reader ouvert pour lancer le sous-titrage ou jouer la voix d'action qui permet de réaliser la vidéo et le son.
