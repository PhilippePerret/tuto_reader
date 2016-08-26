# encoding: UTF-8
class Tuto
class Reader

  # Tout le code JS à introduire dans la page
  #
  # Ce code, pour le moment, est tiré des fichiers .js du dossier 'reader/js'
  def balise_javascript
    File.exist?(folder_js) || raise("Le dossier des javascript doit exister ! (#{folder_js})")
    "<script type=\"text/javascript\">#{all_js}</script>"
  end

  def all_js
    require 'erb'
    Dir["#{folder_js}/**/*.js"].collect do |m|
      codejs = File.open(m, 'rb'){|f| f.read.force_encoding('utf-8')}
      ERB.new(codejs).result()
    end.join("\n")
  end

  def folder_js
    @folder_js ||= File.join(APP_LIB_FOLDER, 'tuto', 'reader', 'js')
  end

end #/Reader
end #/Tuto
