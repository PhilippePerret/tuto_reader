# encoding: UTF-8
=begin
  Class Tuto::Script::Line
  ------------------------
  Gestion d'une ligne du script de tutoriel
=end
class Tuto
class Script
class Line

  MOTS_REPERES = ['FAIRE', 'TODO', 'DIRE']
  REG_MOTS_REPERES = /^(#{MOTS_REPERES.join('|')}): /o

  # Instance Tuto::Script du script contenant cette ligne
  attr_reader :script

  # {String} La ligne brute telle que fournie à l'instanciation
  attr_reader :raw

  # {Fixnum} L'index de la ligne
  attr_reader :index

  def initialize script, raw_line, index_line
    @script = script
    @raw    = raw_line
    @index  = index_line
  end

  # {Fixnum} Le retrait de la ligne. On le calcule simplement en
  # comparant la longueur de la ligne brute avec la ligne strippé
  def retrait
    @retrait ||= raw.length - striped.length
  end

  # La ligne strippée
  def striped
    @striped ||= raw.strip
  end
  # La ligne réelle, sans le premier mot si un mot repère
  def real
    @real ||= begin
      if striped.match(REG_MOTS_REPERES)
        striped.sub(REG_MOTS_REPERES){
          @first_word = $1.freeze
          ''
        }.strip
      else
        striped
      end
    end
  end

  # L'instance Tuto::Script::Line qu'il faut exécuter en
  # même temps que le texte.
  def with_action iline = nil
    iline.nil? || @with_action = iline
    @with_action
  end

  def todo?;    @is_todo    = first_word == 'TODO'  end
  def a_faire?; @is_afaire  = first_word == 'FAIRE' end
  def a_dire?;  @is_adire   = first_word == 'DIRE'  end
  def first_word; @first_word end
end #/Line
end #/Script
end #/Tuto
