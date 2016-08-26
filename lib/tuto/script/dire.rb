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
      require 'json'
      '[' + phrases_a_dire.collect do |line|
        {line_text: line.to_js, line_action: line.with_action_to_js, line_index: line.index}.to_json
      end.join(', ') + ']'
    end
  end
end #/Script
end #/Tuto
