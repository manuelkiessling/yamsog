class CommandController < ApplicationController

  def addplayer
    #{ "command" => "addplayer", "player_name" => "John Doe"},
    player_name = params[:player_name]
    command = {"command" => "addplayer", "player_name" => player_name}
    @command = command.to_json
    write_command command
  end

  def addunit
    #{ "command" => "addunit", "commander" => "player1", "unit_type" => "soldier", "col" => "4", "row" => "5"}
    player_id = params[:player_id]
    unit_type = params[:unit_type]
    col = params[:col]
    row = params[:row]
    command = {"command" => "addunit", "commander" => "player" + player_id, "unit_type" => unit_type, "col" => col, "row" => row}
    @command = command.to_json
    write_command command
  end


  protected
  
  def write_command(command)
    f = File.open("/var/tmp/commands", "w")
    f.write([command].to_json)
    f.close
  end

end
