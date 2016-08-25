# encoding: UTF-8
class Tuto

  def script
    @script ||= Script.new(self)
  end

  def reader
    @reader ||= Reader.new(self)
  end

end #/Tuto
