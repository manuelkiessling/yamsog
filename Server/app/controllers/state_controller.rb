class StateController < ApplicationController

  def get
    f = File.open("/var/tmp/state", "r")
    string = ""
    while line = f.gets
      string = string + line
    end
    @state = params[:callback] + "(" + string + ")"
  end

end
