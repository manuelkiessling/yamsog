module Yamsog
  module Unit
    
    class Abstract
      attr_reader :health, :player, :id
      attr_accessor :row, :col
      
      @@number_of_instances = 0
      
      def initialize(player)
        @player = player
        @health = 10
        @id = @@number_of_instances
        @@number_of_instances += 1
        @row = nil
        @col = nil
      end

      def movement
        raise NotImplementedError
      end

      def hurt(damage)
        @health = @health - damage
      end
      
      def alive?
        return !dead?
      end
      
      def dead?
        return true if @health <= 0
        false
      end
      
      def rep
        return {"id" => self.id, "type" => self.class.rep_name, "player" => player.id}
      end
      
      def rep_name
        self.class.rep_name
      end

      def self.rep_name
        self.name.split('::').last.downcase
      end
      
      def move(row, col)
        raise CantMoveUnitThatIsNotYetPlacedOnMapException.new if @row.nil?
        @player.game.map.move_unit(@row, @col, row, col)
      end
      
    end
    
    class CantMoveUnitThatIsNotYetPlacedOnMapException < Exception; end
  
  end
end
