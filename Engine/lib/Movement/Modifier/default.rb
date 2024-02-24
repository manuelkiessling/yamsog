require "_autoload.rb"

module Yamsog
  module Movement
    module Modifier

      class Default
        
        def initialize(factor)
          raise Exception if factor < -100.0
          @factor = 100.0 + factor
        end
                
        def get_modified_speed_of(movement)
          raise Exception unless movement.kind_of? Yamsog::Movement::Abstract
          movement.get_speed * (@factor / 100.0)
        end
        
      end

      class Exception < ::Exception
      end
    
    end
  end
end
