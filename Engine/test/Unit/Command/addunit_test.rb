module Yamsog
  module Command

    class AddunitTest < Test::Unit::TestCase
              
      def test_create
        c = Addunit.new()
        c.commander = [Yamsog::Player, 1]
        c.unit_type = Yamsog::Unit::Soldier
        c.row = 4
        c.col = 5 
        assert_equal([[Yamsog::Player, 1], Yamsog::Unit::Soldier, 4, 5], [c.commander, c.unit_type, c.row, c.col])
      end
            
    end
      
  end
end
