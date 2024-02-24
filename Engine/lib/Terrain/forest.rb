require "_autoload.rb"

module Yamsog
  module Terrain

    class Forest < Abstract
      
      def shortname
        'f'
      end

      def add_allowed_movements
        self.add_allowed_movement_class_with_modifier(Yamsog::Movement::Walk, Yamsog::Movement::Modifier::Default.new(-25))
      end
      
    end
  
  end
end
