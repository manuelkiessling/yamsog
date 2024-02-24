class GameTest < Test::Unit::TestCase
  
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
    @map = Yamsog::Map::Map.new(terrain_definition)
  end

  def test_initialize
    Yamsog::Game::Game.new(@map)
  end
  
  def test_get_map
    g = Yamsog::Game::Game.new(@map)
    assert_equal(@map, g.map)
  end
  
  def test_add_player
    g = Yamsog::Game::Game.new(@map)
    p = Yamsog::Player::Abstract.new("John Doe")
    g.add_player(p)
    assert_equal([g, @map], [p.game, p.game.map])
  end
  
  def test_add_player_fails_if_duplicate_name
    g = Yamsog::Game::Game.new(@map)
    p = Yamsog::Player::Abstract.new("John Doe")
    g.add_player(p)
    p = Yamsog::Player::Abstract.new("John Doe")
    assert_raise(Yamsog::Game::DuplicatePlayernamesException) do
      g.add_player(p)
    end
  end
  
  def test_player_by_id
    g = Yamsog::Game::Game.new(@map)
    p = Yamsog::Player::Abstract.new("John Doe")
    g.add_player(p)
    assert_equal(p, g.player_by_id(p.id))
  end
  
  def test_player_by_id_fails_for_nonexistent_player
    g = Yamsog::Game::Game.new(@map)
    p = Yamsog::Player::Abstract.new("John Doe")
    g.add_player(p)
    assert_raise(Yamsog::Game::NoSuchPlayerException) do
      i = g.player_by_id(432987)
    end
  end
  
  def test_apply_commands
    g = Yamsog::Game::Game.new(@map)
    assert_equal(true, g.apply_commands([Yamsog::Command::Goto.new]))
  end
  
  def test_loop_without_command_doesnt_change_state
    g = Yamsog::Game::Game.new(@map)
    oldstate = g.state
    g.loop
    assert_equal(oldstate, g.state)
  end
  
  def test_loop_with_addunit_changes_state
    g = Yamsog::Game::Game.new(@map)
    p = Yamsog::Player::Abstract.new("John Doe")
    g.add_player(p)
    oldstate = g.state
    c = Yamsog::Command::Addunit.new
    c.commander = [Yamsog::Player, g.players[0].id]
    c.unit_type = Yamsog::Unit::Soldier
    c.row, c.col = 5, 5
    g.apply_commands([c])
    g.loop
    assert_not_equal(oldstate, g.state)
  end
  
  def test_state
    g = Yamsog::Game::Game.new(@map)
    assert_equal({"map" => g.map.rep}, g.state)
  end
  
  def test_events
    g = Yamsog::Game::Game.new(@map)
    assert_equal([], g.events)
  end
  
end
