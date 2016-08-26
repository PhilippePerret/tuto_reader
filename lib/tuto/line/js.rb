# encoding: UTF-8
class Tuto
class Script
class Line

  # La phrase telle qu'elle doit être préparée pour Javascript, pour être
  # inscrite
  def to_js
    self.real.
      gsub(/\*(.*?)\*/, '<strong>\1</strong>').
      gsub(/\b_(.*?)_\b/, '<em>\1</em>').
      gsub(/\./, '.<br>').
      gsub(/…/, '<br>[TEMPS]</br>')
  end

  # Si la phrase à dire doit être accompagnée d'une action, on indique
  # la phrase de l'action pour js.
  # Retourne 'null' si aucune action
  def with_action_to_js
    if with_action
      with_action.to_js
    else
      'null'
    end
  end
end #/Line
end #/Script
end #/Tuto
