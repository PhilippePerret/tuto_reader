# encoding: UTF-8
class Tuto

  def options
    @options ||= {
      open: true
    }
  end

  def parse_options args
    args.each do |arg|
      case arg
      when '--help'
        self.options.merge!(aide: true)
      when '--prog', '--programme'
        self.options.merge!(programme: true)
      when '--say', '-s'
        self.options.merge!(
          say:  true,
          open: false
          )
      when '-v', '--verbose'
        self.options.merge!(verbose: true)
      when '-no', '--noopen', '--notopen'
        self.options[:open] = false
      else
        puts "Argument non défini : #{arg}"
      end
    end
  end

end
