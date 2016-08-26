class Tuto
class Script

  # Méthode qui construit le fichier voix avec toutes les actions.
  #
  def build_voice_file
    self.parse
    puts "Fabrication du fichier voix des action"
    File.unlink path_audio_file if File.exist? path_audio_file
    speech = phrases_a_faire.collect{|line| line.real}.join("[[slnc 4000]]")
    speech += "[[slnc 4000]]FIN"
    `say -v "#{tuto.reader.options[:voice]}" -r #{tuto.reader.options[:voice_rate]} -o "#{path_audio_file}" #{speech.inspect}`
  end
  # /build_voice_file

  # def voice_folder
  #   @voice_folder ||= begin
  #     require 'fileutils'
  #     d = File.join(APP_FOLDER, 'voices')
  #     FileUtils.rm_rf(d) if File.exist?(d)
  #     `mkdir -p "#{d}"`
  #     d
  #   end
  # end
  # # /voice_folder

  def path_audio_file
    @path_audio_file ||= File.join(self.folder, 'fichier_voix_actions.mp4')
  end


end #/Script
end #/Tuto
