# encoding: UTF-8
=begin

  Class Tuto::Reader
  ------------
  Le "reader" concerne le fichier HTML (ou autre) qui affiche les textes et
  dit les actions à faire.
=end
class Tuto
class Reader

  # Instance {Tuto} du tutoriel de ce reader
  attr_reader :tuto
  def initialize tuto
    @tuto = tuto
  end


  def open
    File.exist?(path) || build
    `open -a Firefox "#{path}"`
  end

  def options
    @options ||= begin
      {
          titre: "Tuto Reader"
      }
    end
  end

  # Chemin d'accès au fichier principal créé
  def path
    @path ||= begin
      File.join(tuto.script.folder, 'tuto_reader.html')
    end
  end


end #/Reader
end #/Reader
