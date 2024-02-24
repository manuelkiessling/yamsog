module Yamsog
  module Player
    
    class Abstract
      attr_reader :name, :units, :id
      attr_accessor :game
      
      @@number_of_instances = 0
      
      def initialize(name)
        @name = name
        @units = []
        @id = @@number_of_instances
        @@number_of_instances += 1
      end
      
      def add_unit(unit_class)
        @units.push unit_class.new(self)
      end
      
    end
  
  end
end
