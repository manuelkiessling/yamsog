module Yamsog
  module GameServer
    module Converter

      class CommandsTest < Test::Unit::TestCase
        
        def setup
          
          @command_hashes = [
            { "commander" => "player1", "receiver" => "unit3", "command" => "goto", "row" => 2, "col" => 4},
            { "commander" => "player2", "receiver" => "unit1", "command" => "goto", "row" => 5, "col" => 5},
            { "commander" => "player1", "receiver" => "unit3", "command" => "attack", "row" => 5, "col" => 5},
            { "commander" => "player1", "receiver" => "unit3", "command" => "cancel"},
            { "command" => "addplayer", "player_name" => "John Doe"},
            { "commander" => "player1", "unit_type" => "soldier", "command" => "addunit", "row" => 2, "col" => 4}
          ]
          
          @c1 = Yamsog::Command::Goto.new()
          @c1.commander = [Yamsog::Player, 1]
          @c1.receiver = [Yamsog::Unit, 3]
          @c1.row = 2
          @c1.col = 4
          
          @c2 = Yamsog::Command::Goto.new()
          @c2.commander = [Yamsog::Player, 2]
          @c2.receiver = [Yamsog::Unit, 1]
          @c2.row = 5
          @c2.col = 5
          
          @c3 = Yamsog::Command::Attack.new()
          @c3.commander = [Yamsog::Player, 1]
          @c3.receiver = [Yamsog::Unit, 3]
          @c3.row = 5
          @c3.col = 5
          
          @c4 = Yamsog::Command::Cancel.new()
          @c4.commander = [Yamsog::Player, 1]
          @c4.receiver = [Yamsog::Unit, 3]
          
          @c5 = Yamsog::Command::Addplayer.new()
          @c5.player_name = "John Doe"
          
          @c6 = Yamsog::Command::Addunit.new()
          @c6.commander = [Yamsog::Player, 1]
          @c6.unit_type = Yamsog::Unit::Soldier
          @c6.row = 2
          @c6.col = 4
        end
        
        def test_get
          commands = Commands.convert(@command_hashes)          
          expected, actual = [], []
          
          i = 0
          [@c1, @c2, @c3, @c4, @c5, @c6].each do |c|
            expected.push c.class
            actual.push commands[i].class
            c.instance_variables.each do |var|
              expected.push c.instance_variable_get(var)
              actual.push commands[i].instance_variable_get(var)
            end
            i += 1
          end
          
          assert_equal(expected, actual)
        end
        
      end
      
    end
  end
end
