module Yamsog
  module Action

    class AddplayerTest < Test::Unit::TestCase

      def setup
        string = <<-END
          g
        END
        
        key = {
             Yamsog::Terrain::Grass.new().shortname => Yamsog::Terrain::Grass
        }
        
        mb = Yamsog::Map::MatrixBuilder.new
        terrain_definition = mb.from_string_with_key(string, key)
        map = Yamsog::Map::Map.new(terrain_definition)
        
        @g = Yamsog::Game::Game.new(map)        
      end

      def test_add_player
        c = Yamsog::Command::Addplayer.new
        c.player_name = "John Doe"
        a = Addplayer.new(@g, c)
        a.loop
        assert_equal(@g.players[0].class, Yamsog::Player::Abstract)
      end

      def test_finished_after_one_loop
        c = Yamsog::Command::Addplayer.new
        c.player_name = "John Doe"
        a = Addplayer.new(@g, c)
        a.loop
        assert_equal(true, a.finished?)
      end
      
      def test_add_two_players
        c = Yamsog::Command::Addplayer.new
        c.player_name = "John Doe"
        a = Addplayer.new(@g, c)
        a.loop
        c = Yamsog::Command::Addplayer.new
        c.player_name = "Jane Doe"
        a = Addplayer.new(@g, c)
        a.loop
        assert_equal(@g.players[1].class, Yamsog::Player::Abstract)
      end
      
      def test_events
        c = Yamsog::Command::Addplayer.new
        c.player_name = "John Doe"
        a = Addplayer.new(@g, c)
        a.loop
        
        p = Yamsog::Player::Abstract.new("Jane Doe")
        e = Yamsog::Event::Abstract.new("player_added")
        e.add_info("player_name", "John Doe")
        e.add_info("player_id", p.id - 1)
        
        events = a.events
        event = events[0]
        
        assert_equal(e.to_hash, event.to_hash)
      end
      
    end

  end
end
