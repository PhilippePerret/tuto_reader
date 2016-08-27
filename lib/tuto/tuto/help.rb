# encoding: UTF-8
class Tuto
  def help
    grosse_delim = '='*70
    delim = '-'*70
    <<-TXT


#{grosse_delim}
  MANUEL TUTO-READER
#{grosse_delim}

  Tuto-Reader est un lecteur de tutoriel qui permet, à partir
  d'un fichier texte définissant le plan du tutoriel, les textes
  à dire et les actions à faire, de proposer :
    - un lecteur qui va permettre de réaliser la "bande-son" du
      tutoriel, comme un travail de sous-titrage
    - d'énoncer les actions à faire pour les réaliser avec la
      vidéo.

  @syntax

      tuto[ options][ path/file/tuto_script[.txt]]

  @exemple

      cd ~/tutoriels/mon_tuto/
      tuto script_tutoriel.txt

#{delim}

  Obtenir cette aide
  ------------------

      tuto --help

#{delim}

  Modifier le programme
  ---------------------

      tuto --prog
      tuto --programme

      Cette commande option ouvre le dossier du programme tuto-reader
      dans Atom.

#{delim}

  OPTIONS
  -------

    -v/--verbose      Pour des messages de suivi dans la console
    -no/--nopen       Pour ne pas ouvrir le fichier HTML produit.
                      Par défaut, ce fichier s'ouvre dès qu'on demande
                      le tutoriel
    -s/--say          Au lieu d'ouvrir le fichier HTML du reader, le
                      programme lit les actions qui doivent être accomplies.
    TXT
  end
end #/Tuto
