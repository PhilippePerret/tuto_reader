# encoding: UTF-8
class Tuto

  def script
    @script ||= Script.new(self)
  end

  def reader
    @reader ||= Reader.new(self)
  end

  def make_reader_and_open
    self.script.parse
    self.reader.build
    self.reader.open
  end

  def say_actions
    self.script.parse
    self.script.phrases_a_faire.each do |line|
      `say "#{line.real}"`
    end
  end

end #/Tuto
