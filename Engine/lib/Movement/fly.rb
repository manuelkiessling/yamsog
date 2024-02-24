require "_autoload.rb"

module Yamsog
  module Movement

    class Fly < Abstract
      
      def initialize
        @speed = 500.0
        super
      end

    end

  end
end
