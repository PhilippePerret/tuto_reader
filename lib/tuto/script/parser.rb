# encoding: UTF-8
=begin

  Parseur du script de tutoriel

=end
class Tuto
class Script

  def parse
    puts "-> parse"
    prev_line = nil
    lines.each do |line|
      # line est une instance Tuto::Script::Line
      puts "#{line.index}: Retrait #{line.retrait} : #{line.real} (#{line.first_word})"
      if line.a_dire?
        phrases_a_dire << line
        if prev_line && prev_line.a_faire?
          line.with_action prev_line
        end
      elsif line.a_faire?
        phrases_a_faire << line
      end
      prev_line = line
    end
    puts "<- parse"
  end


end #/Script
end #/Tuto
