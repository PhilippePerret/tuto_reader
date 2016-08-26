# encoding: UTF-8
=begin

  Méthode de la class Tuto::Script qui gère les phrases à dire.
  Ce sont des phrases qui commencent par DIRE:

=end
class Tuto
class Script

  def phrases_a_dire
    @phrases_a_dire ||= Array.new
  end

  def javascript_phrases
    @javascript_phrases ||= begin
      '[' + phrases_a_dire.collect do |line|
        line.real.
          gsub(/\*(.*?)\*/, '<strong>\1</strong>').
          gsub(/\b_(.*?)_\b/, '<em>\1</em>').
          gsub(/"/, '\"').
          gsub(/\./, '.<br>').
          gsub(/…/, '.<br>[TEMPS]</br>').inspect
      end.join(', ') + ']'
    end
  end
end #/Script
end #/Tuto
