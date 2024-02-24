module Yamsog
  module Unit

    class SoldierTest < Test::Unit::TestCase

      def test_rep
        p = Yamsog::Player::Abstract.new("John Doe")
        u1 = Soldier.new(p)
        u2 = Soldier.new(p)
        assert_equal({"id" => u1.id + 1, "type" => "soldier", "player" => p.id}, u2.rep)
      end
      
      def test_movement
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Soldier.new(p)
        assert_equal(Yamsog::Movement::Walk, u.movement.class)
      end

    end

  end
end
