# encoding: UTF-8
class Tuto
class Reader

  # = main =
  #
  # Construction du reader de tutoriel d'après son script
  def build
    File.unlink path if File.exist? path
    File.open(path,'wb'){ |f| f.write code_reader }
    return self
  end

  # = main =
  #
  # Retourne tout le code HTML à copier dans le fichier reader
  def code_reader
    '<html>' +
        head + body + foot +
    '</html>'
  end

  def head
    '<head>'            +
      balise_encoding   +
      balise_title      +
      balise_javascript +
      balise_css        +
    '</head>'
  end
  def body
    '<body>'            +
      div_titre         +
      div_reader        +
      div_infos         +
      div_boutons       +
    '</body>'
  end
  def foot
    ''
  end

  # ---------------------------------------------------------------------

  def balise_encoding
    '<meta http-equiv="Content-type" content="text/html; charset=utf-8">'
  end
  def balise_title
    "<title>#{options[:titre]}</title>"
  end

  # ---------------------------------------------------------------------

  def div_titre
    "<h1>Tuto reader pour : </h1>"
  end

  def div_reader
    '<div id="reader">' +
      '<div id="reader_prev_phrase">La phrase précédente s’affichera ici</div>' +
      '<div id="reader_curr_phrase">La phrase courante s’affichera ici, c’est elle qu’il faut dire.</div>' +
      '<div id="reader_next_phrase">La phrase suivante s’affichera là, pour la préparer mentalement.</div>' +
    '</div>'
  end
  def div_infos
    '<div id="infos">' +
      '<span>Phrase : <span id="index_phrase"></span> (<span id="duree_phrase"></span>)</span>' +
    '</div>'
  end
  def div_boutons
    '<div id="boutons">'+
      '<input type="button" value="-" onclick="decrease_speed()" />'        +
      '<span id="speed"><script>document.write(speed);</script></span>'     +
      '<input type="button" value="+" onclick="increase_speed()" />'        +
      '<input type="button" value="⏪" onclick="quick_backward()" />'        +
      '<input type="button" id="btn_stop" value="⏹" onclick="stop()" style="visibility:hidden;" />'   +
      '<input type="button" id="btn_start" value="⏺" onclick="start()" />'   +
      '<input type="button" value="⏩" onclick="quick_forward()" />'        +
    '</div>'
  end

  # ---------------------------------------------------------------------


end #/Reader
end #/Tuto
