# encoding: UTF-8
=begin

  Options pour la classe Tuto::Reader

=end
class Tuto
class Reader
  def options
    @options ||= {
      duree_lecture_mot:    350, # en millisecondes, pour javascript
      titre:  "Tuto Reader",
      voice:  "Virginie",
      voice_rate: 175
    }
  end
end #/Reader
end #/Tuto
