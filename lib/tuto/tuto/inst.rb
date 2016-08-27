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
    # cmd = "say -f '#{self.script.path_audio_file}'"
    # log "Run command : #{cmd}"
    # log `#{cmd}`
    `open #{self.script.path_audio_file.gsub(/ /,'\\ ')}`
  end

end #/Tuto
