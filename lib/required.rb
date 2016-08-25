# encoding: UTF-8

class Tuto
  APP_LIB_FOLDER = File.dirname(File.expand_path(__FILE__))
  APP_FOLDER = File.dirname(APP_LIB_FOLDER)
end

# Charger tout le dossier script
Dir["#{Tuto::APP_LIB_FOLDER}/tuto/**/*.rb"].each{|m| require m}
