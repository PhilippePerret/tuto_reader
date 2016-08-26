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
      balise_css        +
    '</head>'
  end
  def body
    '<body>'            +
      div_titre         +
      div_top_boutons   +
      div_action        +
      div_audio         +
      div_reader        +
      # div_infos         + # remplacé par les boutons audio
      div_boutons       +
    '</body>' + balise_javascript
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
    "<h1><span id='state'></span>Tuto reader pour : </h1>"
  end

  def div_top_boutons
    '<div id="top_boutons">'+
      '<input id="btn_edit_phrase" type="button" onclick="edit_phrase_courante()" value="Édit phrase courante" style="visibility:hidden;" />' +
    '</div>'
  end
  def div_action
    '<div id="action">' +
    '</div>'
  end
  def div_audio
    '<div id="div_audio">'+
      '<audio id="actions_audio" preload="auto" src="fichier_voix_actions.mp4" type="audio/mp4">Pas de lecteur audio dans ce navigateur. Utiliser plutôt Firefox.</audio>' +
      '<input id="btn_audio_stop" type="button" value="⏹" onclick="stop_action_audio()" />' +
      '<input id="btn_audio_play" type="button" value="⏺" onclick="start_action_audio()" />' +
    '</div>'
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
      '<div id="div_speed">' +
        '<span id="speed">10</span>'     +
        '<input type="button" value="-" onclick="decrease_speed()" />'        +
        '<input type="button" value="+" onclick="increase_speed()" />'        +
      '</div>' +
      '<input type="button" id="btn_backward" value="⏪" onclick="quick_backward()" />'        +
      '<input type="button" id="btn_stop" value="⏹" onclick="stop()" style="visibility:hidden;" />'   +
      '<input type="button" id="btn_start" value="⏺" onclick="start()" />'   +
      '<input type="button" id="btn_forward" value="⏩" onclick="quick_forward()" />'        +
    '</div>'
  end

  # ---------------------------------------------------------------------


end #/Reader
end #/Tuto
