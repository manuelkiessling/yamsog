require "_autoload.rb"

module Yamsog
  module Movement

    class Abstract
      
      def get_speed
        @speed
      end
      
      def change_default_speed_by!(speed_factor)
         @speed = @speed * (speed_factor / 100.0)
      end

    end

  end
end
