module Yamsog
  module Game
    
    class Game
      attr_reader :map, :players
      
      def initialize(map)
        @map = map
        @players = []
        @commands = []
      end
      
      def add_player(player)
        @players.each do |p|
          if p.name == player.name
            raise DuplicatePlayernamesException
          end
        end
        @players.push player
        player.game = self
      end
      
      def player_by_id(id)
        @players.each do |player|
          if player.id == id
            return player
          end
        end
        raise NoSuchPlayerException
      end
      
      def apply_commands(commands)
        commands.each do |command|
          @commands.push command
        end
        true
      end
      
      def state
        {"map" => @map.rep}
      end
      
      def events
        []
      end
      
      def loop
        @commands.each do |command|
          
          if command.class == Yamsog::Command::Addunit
            action = Yamsog::Action::Addunit.new(self, command)
            action.loop
          end
          
          if command.class == Yamsog::Command::Addplayer
            action = Yamsog::Action::Addplayer.new(self, command)
            action.loop
          end
          
          #p action.events
          
        end
        @commands = []
      end
      
    end
  
    class DuplicatePlayernamesException < Exception; end
    class NoSuchPlayerException < Exception; end
  
  end
end
