module Yamsog
  module GameServer

    class Base
      attr_writer :map_source, :commands_source, :events_target, :state_target

      def initialize()
      end
    
      def map_string
        raise NotImplementedError
      end
      
      def map_key
        raise NotImplementedError
      end
      
      def map(string, key)
        mb = Yamsog::Map::MatrixBuilder.new
        t = mb.from_string_with_key(string, key)
        m = Yamsog::Map::Map.new(t)
        return m
      end
      
      def get_commands_source_handler(commands_source)
        raise NotImplementedError
      end
      
      def new_commands_available(commands_source_handler)
        raise NotImplementedError
      end
      
      def new_commands(commands_source_handler)
        raise NotImplementedError
      end
      
      def cleanup_commands_source(commands_source_handler)
        raise NotImplementedError
      end
      
      def write_events(events)
        raise NotImplementedError
      end

      def write_state(state)
        raise NotImplementedError
      end

      def start_game()
        game = Yamsog::Game::Game.new(map(map_string, map_key))
        game
      end
      
      def run_game_loop(game)
        csh = get_commands_source_handler(@commands_source)
        if new_commands_available(csh)
          begin
            raw = new_commands(csh)
            converted = Converter::Commands.convert(raw)
            p converted
            game.apply_commands(converted)
          rescue CorruptCommandsInSourceException
            puts "Error in read commands. I will ignore these commands, clear the command source, and continue processing. The corrupt commands were: "
            puts $!.corrupt_commands
          rescue CommandSourceEmptyException
            puts "I expected to find new commands in the source, but found none. Continuing anyway..."
          end          
          cleanup_commands_source(csh)
        end
        game.loop
        write_state(game.state)
        write_events(game.events)
      end
      
    end

    class CorruptCommandsInSourceException < Exception
      attr_accessor :corrupt_commands
    end
    
    class CommandSourceEmptyException < Exception; end

  end
end
