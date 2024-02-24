module Yamsog
  module Player

    class AbstractTest < Test::Unit::TestCase

      def test_initialize
        p1 = Abstract.new("Jane Doe")
        p2 = Abstract.new("John Doe")
        assert_equal(["John Doe", p1.id + 1], [p2.name, p2.id])
      end
      
      def test_add_unit
        p = Abstract.new("John Doe")
        p.add_unit(Yamsog::Unit::Soldier)
        assert_equal(p, p.units[0].player)
      end

    end

  end
end
