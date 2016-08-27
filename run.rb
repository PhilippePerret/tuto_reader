# encoding: UTF-8
=begin

  Utiliser :

      cd path/to/tutoriel/folder
      tuto 'nom_du_fichier_script'

  Pour ouvrir ce dossier programme :

      tuto --programme

  Pour obtenir l'aide

      tuto --help

=end
require_relative 'lib/required'

# Le tutoriel
def tuto; @tuto ||= Tuto.new end

args = ARGV

# Le script du tutoriel
# ---------------------
tuto.script.path = File.expand_path(args.pop)
tuto.script.path_valide? || exit(1)


# Analyse des options
# -------------------
tuto.parse_options(args)

if tuto.options[:programme]
  Tuto.open_programme
elsif tuto.options[:aide]
  puts Tuto.help
else
  tuto.make_reader
  tuto.options[:open] && tuto.open_reader
  tuto.options[:say]  && tuto.say_actions
end
