require "_autoload.rb"

if ARGV[0] == "localfile"
  server = Yamsog::GameServer::Localfile.new()
else
  puts "No such game server '" + ARGV[0].to_s + "'"
  Kernel.exit!
end

server.map_source = ARGV[1]
server.commands_source = ARGV[2]
server.events_target = ARGV[3]
server.state_target = ARGV[4]
  
puts "Starting Yamsog game server..."
game = server.start_game()

#Kernel.exit!

puts "Running game loops..."
i = 0
while true do
  i += 1
  server.run_game_loop(game)
  Kernel.sleep(1)
  if i == 1000
    puts "."
    i = 0
  end
end
