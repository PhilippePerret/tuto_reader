class Tuto
class Script

  # Méthode qui construit le fichier voix avec toutes les actions.
  #
  def build_voice_file
    self.parse
    log "Fabrication du fichier voix des action…"
    File.unlink path_audio_file if File.exist? path_audio_file
    File.unlink path_audio_text if File.exist? path_audio_text
    speech = phrases_a_faire.collect do |line|
      line.real.gsub(/\./, '. [[slnc 1500]]')
    end.join("[[slnc 4000]]")
    speech += "[[slnc 4000]]FIN"
    # Construire le fichier texte
    File.open(path_audio_text,'wb'){|f| f.write speech.force_encoding('utf-8')}
    # Construire le fichier audio
    `say -v "#{tuto.reader.options[:voice]}" -r #{tuto.reader.options[:voice_rate]} -o "#{path_audio_file}" #{speech.inspect}`
  end
  # /build_voice_file


  def path_audio_text
    @path_audio_text ||= File.join(self.folder, 'fichier_voix_actions.txt')
  end

  def path_audio_file
    @path_audio_file ||= File.join(self.folder, 'fichier_voix_actions.mp4')
  end


end #/Script
end #/Tuto
