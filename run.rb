# encoding: UTF-8


require_relative 'lib/required'


tuto = Tuto.new
# On définit le path du script
tuto.script.path = '/Users/philippeperret/Library/Mobile Documents/com~apple~CloudDocs/ECRITURE/Tutoriels/Feuilles-de-style/PLAN_GENERAL.TXT'

# # Pour fabriquer le fichier audio qui va dire les actions
tuto.script.build_voice_file

# # Pour construire le reader et l'ouvrir
tuto.make_reader_and_open
