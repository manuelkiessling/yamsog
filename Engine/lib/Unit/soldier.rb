module Yamsog
  module Unit
    
    class Soldier < Abstract

      def initialize(player)
        super
        @health = 5
        @movement = Yamsog::Movement::Walk.new
      end
      
      def movement
        @movement
      end

    end
  
  end
end
