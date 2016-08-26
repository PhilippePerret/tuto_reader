# encoding: UTF-8
class Tuto
class Reader

  # Tout le code JS à introduire dans la page
  #
  # Ce code, pour le moment, est tiré des fichiers .js du dossier 'reader/js'
  def balise_javascript
    "<script type=\"text/javascript\">#{all_js}</script>"
  end

  def all_js
    Dir["#{folder_js}/**/*.js"].collect do |m|
      File.open(m, 'rb'){|f| f.read.force_encoding('utf-8')}
    end.join("\n")
  end

  def folder_js
    @folder_js ||= File.join(APP_FOLDER, 'reader', 'js')
  end

end #/Reader
end #/Tuto
