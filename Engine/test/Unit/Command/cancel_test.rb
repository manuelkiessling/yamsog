module Yamsog
  module Command

    class CancelTest < Test::Unit::TestCase
              
      def test_create
        c = Abstract.new()
        c.commander = [Yamsog::Player, 1]
        c.receiver = [Yamsog::Unit, 3]
        assert_equal([[Yamsog::Player, 1], [Yamsog::Unit, 3]], [c.commander, c.receiver])
      end
      
    end
      
  end
end
