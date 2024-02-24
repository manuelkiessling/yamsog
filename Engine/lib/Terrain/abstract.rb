module Yamsog
  module Terrain

    class Abstract

      def initialize
        @allowed_movements = []
        self.add_allowed_movements
      end
      
      def shortname
        raise NotImplementedError
      end
      
      def add_allowed_movements
      end

      def add_allowed_movement_class_with_modifier(movement_class, modifier)
        raise "Not a movement" unless movement_class.superclass == Yamsog::Movement::Abstract
        @allowed_movements.push [movement_class, modifier]
      end
      
      def is_movement_allowed?(movement)
        @allowed_movements.each do |allowed_movement|
          return true if (allowed_movement[0] == movement.class)
        end
        return false
      end

      def get_modifier_for_movement(movement)
        raise "Not a movement" unless movement.class.superclass == Yamsog::Movement::Abstract
        @allowed_movements.each do |allowed_movement|
          return allowed_movement[1] if (allowed_movement[0] == movement.class)
        end
        raise "Not an allowed movement on this terrain" unless movement_class.superclass == Yamsog::Movement::Abstract
      end

      def rep
        return shortname
      end
      
    end

  end
end
