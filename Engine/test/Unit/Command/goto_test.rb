module Yamsog
  module Command

    class GotoTest < Test::Unit::TestCase
              
      def test_create
        c = Attack.new()
        c.commander = [Yamsog::Player, 1]
        c.receiver = [Yamsog::Unit, 3]
        c.row = 4
        c.col = 5
        assert_equal([[Yamsog::Player, 1], [Yamsog::Unit, 3], 4, 5], [c.commander, c.receiver, c.row, c.col])
      end
      
    end
      
  end
end
