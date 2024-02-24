module Yamsog
  module Terrain

    class Test < Abstract

      def shortname
        't'
      end
      
      def add_allowed_movements
        self.add_allowed_movement_class_with_modifier(Yamsog::Movement::Walk, Yamsog::Movement::Modifier::Default.new(-25))
      end
      
    end
      
  end
end

class AbstractTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Test.new
    assert_equal('t', t.rep)
  end

  def test_is_movement_allowed?
    t = Yamsog::Terrain::Test.new
    assert_equal(true, (t.is_movement_allowed? Yamsog::Movement::Walk.new))
  end

  def test_get_modifier_for_movement
    t = Yamsog::Terrain::Test.new
    assert_equal(Yamsog::Movement::Modifier::Default.new(-25).class, t.get_modifier_for_movement(Yamsog::Movement::Walk.new).class)
  end

end
