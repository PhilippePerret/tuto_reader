# encoding: UTF-8
class Tuto

  def script
    @script ||= Script.new(self)
  end

  def reader
    @reader ||= Reader.new(self)
  end

  def make_reader
    self.script.parse
    self.script.build_voice_file
    self.reader.build
  end

  def open_reader
    self.reader.open
  end

  def say_actions
    puts "\n\nTaper CTRL C pour interrompre.\n\n"
    cmd = "say --interactive -f '#{self.script.path_audio_text}'"
    log "Run command : #{cmd}"
    log `#{cmd}`
  end

end #/Tuto
