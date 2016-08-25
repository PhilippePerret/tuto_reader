# encoding: UTF-8
=begin

  Class Tuto::Script
  ------------------
  Pour un script de tutoriel

=end
class Tuto
class Script

  # Class {Tuto} du tutoriel courant possédant ce script
  attr_reader :tuto
  def initialize tuto
    @tuto = tuto
  end
end #/Script
end #/Tuto
