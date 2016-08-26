# encoding: UTF-8


require_relative 'lib/required'


tuto = Tuto.new
# On définit le path du script
tuto.script.path = '/Users/philippeperret/Library/Mobile Documents/com~apple~CloudDocs/ECRITURE/Tutoriels/Feuilles-de-style/PLAN_GENERAL.TXT'

# Pour parser le script
tuto.script.parse
# Pour construire le lecteur de tutoriel
tuto.reader.build
tuto.reader.open
