# encoding: UTF-8
=begin

  Parseur du script de tutoriel

=end
class Tuto
class Script

  def parse
    puts "-> parse"
    lines.each do |line|
      # line est une instance Tuto::Script::Line
      puts "#{line.index}: Retrait #{line.retrait} : #{line.real} (#{line.first_word})"
    end
    puts "<- parse"
  end

end #/Script
end #/Tuto
