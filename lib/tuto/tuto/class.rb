# encoding: UTF-8
class Tuto
  class << self

    def open_programme
      cmd = "cd '#{Tuto::APP_FOLDER}';atom ."
      log "CMD : #{cmd}"
      `#{cmd}`
    end

  end #/<< self
end #Tuto
