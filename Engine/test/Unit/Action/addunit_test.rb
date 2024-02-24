module Yamsog
  module Action

    class AddunitTest < Test::Unit::TestCase

      def setup
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
        map = Yamsog::Map::Map.new(terrain_definition)
        
        @g = Yamsog::Game::Game.new(map)
        @p = Yamsog::Player::Abstract.new("John Doe")
        @g.add_player(@p)
        
        @c = Yamsog::Command::Addunit.new()
        @c.commander = [Yamsog::Player, @p.id]
        @c.unit_type = Yamsog::Unit::Soldier
        @c.row = 4
        @c.col = 5
      end

      def test_adds_unit
        a = Addunit.new(@g, @c)
        a.loop
        assert_equal(@g.map.units[4, 5].class, Yamsog::Unit::Soldier)
        assert_equal(@g.map.units[4, 5].player, @p)
      end

      def test_finished_after_one_loop
        @c = Yamsog::Command::Addunit.new()
        @c.commander = [Yamsog::Player, @p.id]
        @c.unit_type = Yamsog::Unit::Soldier
        @c.row = 5
        @c.col = 6
        
        a = Addunit.new(@g, @c)
        a.loop
        
        assert_equal(true, a.finished?)
      end

    end

  end
end
