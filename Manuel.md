# Tutoriel Reader

* [Introduction](#introduction)
* [Composition d'un texte à dire](#compositionduntexteadire)
  * [Texte à dire en même temps qu'une action](#texteadireenmemetempsquuenaction)
* [Action à faire](#compositionduneactionafaire)

<a name='introduction'></a>

## Introduction

Le “tutoriel reader” est un assistant-parseur qui permet de composer des tutoriels à partir d'un texte simple, et de faciliter ensuite sa réalisation, principalement en affichant le texte à dire et en disant les actions à entreprendre.

Ce texte simple fonctionne par “folding”, c'est-à-dire par imbrication, par exemple dans l'application Atom qui permet de les replier et les déplier sans autre forme de procès.

Voici par exemple à quoi ressemble un début de projet de tutoriel (c'est ce qu'on appelle le `script` du tutoriel, le scénario) :

    INTRODUCTION
      PRÉSENTATION DU PROJET
        Dans cette partie, je vais dire ce que je viens faire
          DIRE: Bonjour tout le monde, je vais vous présenter mon projet.
          FAIRE: Passer à la diapo #1
          DIRE:  Sur cette diapo, vous pouvez voir mon chien.
        Ensuite on passe au cœur du sujet
        etc.


<a name='compositionduntexteadire'></a>

## Composition d'un texte à dire


On écrit les textes à dire normalement. Ces textes doivent simplement être précédés de :

    DIRE: <ici le texte à dire>

Dès qu'il y a un point, le texte est passé à la ligne. Dès qu'il y a un point de suspension (…), le texte suivant est passé à la ligne, précédé de “[TEMPS]” pour indiquer qu'il faut passer un temps.

<a name='texteadireenmemetempsquuenaction'></a>

### Texte à dire en même temps qu'une action

Pour définir un texte à dire en même temps qu'une action, on utilise :

    FAIRE:  <l'action à faire en même temps>
    DIRE:   <le texte à dire sur l'action>

<a name='compositionduneactionafaire'></a>

## Action à faire


Ces actions doivent être composées de :

    FAIRE: <ici l'action à faire>
