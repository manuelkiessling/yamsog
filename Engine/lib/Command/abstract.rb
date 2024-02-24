module Yamsog
  module Command

    class Abstract
      attr_accessor :commander, :receiver
              
      def initialize()
        @commander = nil
        @receiver = nil
      end
      
    end
      
  end
end
