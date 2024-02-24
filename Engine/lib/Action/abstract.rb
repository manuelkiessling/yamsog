module Yamsog
  module Action

    class Abstract
      
      def initialize(game, command)
        @game = game
        @command = command
        @events = []
        @finished = false
      end
      
      def loop
        raise NotImplementedError
      end
      
      def events
        @events
      end
      
      def finished?
        return @finished
      end
      
      def finished!
        @finished = true
      end
      
    end
      
  end
end
