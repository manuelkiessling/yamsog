module Yamsog
  module Unit

    class AbstractTest < Test::Unit::TestCase

      def setup_game_and_return_player
        string = <<-END
          gggggggggg
          gggggggwww
          ggggggwwff
          gggppppppp
          ggppggwfpf
          ggpgggwwff
        END
        
        key = {
             Yamsog::Terrain::Forest.new().shortname => Yamsog::Terrain::Forest,
             Yamsog::Terrain::Grass.new().shortname => Yamsog::Terrain::Grass,
             Yamsog::Terrain::Mountain.new().shortname => Yamsog::Terrain::Mountain,
             Yamsog::Terrain::Plain.new().shortname => Yamsog::Terrain::Plain,
             Yamsog::Terrain::Water.new().shortname => Yamsog::Terrain::Water
        }
        
        mb = Yamsog::Map::MatrixBuilder.new
        terrain_definition = mb.from_string_with_key(string, key)
        @map = Yamsog::Map::Map.new(terrain_definition)
        g = Yamsog::Game::Game.new(@map)
        p = Yamsog::Player::Abstract.new("John Doe")
        g.add_player(p)
        return p
      end

      def test_initialize
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        assert_equal(p, u.player)
      end
      
      def test_raise_if_movement
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        assert_raise(NotImplementedError) do
          u.movement
        end
      end

      def test_rep
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        assert_equal({"id" => u.id, "type" => "abstract", "player" => p.id}, u.rep)
      end
      
      def test_position
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        u.row = 3
        u.col = 8
        assert_equal([3, 8], [u.row, u.col])
      end
      
      def test_id_in_rep
        p = Yamsog::Player::Abstract.new("John Doe")
        u1 = Abstract.new(p)
        u2 = Abstract.new(p)
        assert_equal({"id" => u1.id + 1, "type" => "abstract", "player" => p.id}, u2.rep)
      end

      def test_hurt_changes_health
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        h = u.health
        u.hurt(h - 1)
        assert_equal(1, u.health)
      end
      
      def test_dead?
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        h = u.health
        u.hurt(h)
        assert_equal(true, u.dead?)
      end

      def test_not_dead?
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        h = u.health
        u.hurt(h - 1)
        assert_equal(false, u.dead?)
      end

      def test_alive?
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        h = u.health
        u.hurt(h - 1)
        assert_equal(true, u.alive?)
      end
      
      def test_not_alive?
        p = Yamsog::Player::Abstract.new("John Doe")
        u = Abstract.new(p)
        h = u.health
        u.hurt(h)
        assert_equal(false, u.alive?)
      end
      
      def test_move
        p = setup_game_and_return_player
        u = Abstract.new(p)
        p.game.map.place_unit(u, 2, 3)
        u.move(5, 6)
        assert_equal(u, p.game.map.units[5, 6])
      end

      def test_move_exception_if_moving_unplaced_unit
        p = setup_game_and_return_player
        u = Abstract.new(p)
        assert_raise(CantMoveUnitThatIsNotYetPlacedOnMapException) do
          u.move(5, 6)
        end
      end

    end

  end
end
