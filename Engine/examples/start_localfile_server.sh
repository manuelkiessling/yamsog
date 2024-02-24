cd ../lib
touch /var/tmp/commands
ruby ../bin/start_game_server.rb localfile ../examples/maps/simple.ymap /var/tmp/commands /var/tmp/events /var/tmp/state
