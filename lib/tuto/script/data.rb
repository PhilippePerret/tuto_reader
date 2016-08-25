class Tuto
class Script

  # Chemin d'accès au script
  attr_accessor :path

  # Toutes les instances {Tuto::Script::Line} des lignes du script du
  # tutoriel
  def lines
    @lines ||= begin
      raw_code.split("\n").each_with_index.collect do |line, iline|
        Line.new(self, line, iline)
      end
    end
  end

  def raw_code
    @raw_code ||= File.open(path,'rb'){|f| f.read.force_encoding('utf-8')}
  end

  # Le dossier du script du tutoriel
  #
  # Note : c'est dans ce dossier que seront mis les fichiers
  def folder
    @folder ||= File.dirname(path)
  end

end #/Script
end #/Tuto
