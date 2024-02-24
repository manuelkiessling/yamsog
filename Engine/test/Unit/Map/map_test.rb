class MapTest < Test::Unit::TestCase
  
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
    @terrain_definition = mb.from_string_with_key(string, key)
  end

  def test_initialize
    map = Yamsog::Map::Map.new(@terrain_definition)
    assert_equal(map.terrain[2, 9].class, Yamsog::Terrain::Forest)
  end

  def test_all_positions
    map = Yamsog::Map::Map.new(@terrain_definition)
    assert_equal(map.all_positions, @terrain_definition.all_positions)
  end
  
  def test_within?
    assert_equal(true, Yamsog::Map::Map.within?(6, 1, 1, 4, 4))
    assert_equal(false, Yamsog::Map::Map.within?(5, 1, 1, 4, 4))
  end
  
  def test_place_unit
    p = Yamsog::Player::Abstract.new("John Doe")
    u = Yamsog::Unit::Abstract.new(p)
    map = Yamsog::Map::Map.new(@terrain_definition)
    map.place_unit(u, 2, 5)
    assert_equal([u.row, u.col, 2, 5], [map.units[2, 5].row, map.units[2, 5].col, map.units[2, 5].row, map.units[2, 5].col])
  end
  
  def test_place_unit_exception_if_occupied
    p = Yamsog::Player::Abstract.new("John Doe")
    u1 = Yamsog::Unit::Abstract.new(p)
    u2 = Yamsog::Unit::Abstract.new(p)
    map = Yamsog::Map::Map.new(@terrain_definition)
    map.place_unit(u1, 2, 5)
    assert_raise(Yamsog::Map::LocationOccupiedException) do
      map.place_unit(u2, 2, 5)
    end
  end
  
  def test_move_unit
    p = Yamsog::Player::Abstract.new("John Doe")
    u = Yamsog::Unit::Abstract.new(p)
    map = Yamsog::Map::Map.new(@terrain_definition)
    map.place_unit(u, 2, 5)
    map.move_unit(2, 5, 3, 6)
    assert_equal([nil, [3, 6]], [map.units[2, 5], [map.units[3, 6].row, map.units[3, 6].col]])
  end
  
  def test_move_unit_exception_if_target_occupied
    p = Yamsog::Player::Abstract.new("John Doe")
    u1 = Yamsog::Unit::Abstract.new(p)
    u2 = Yamsog::Unit::Abstract.new(p)
    map = Yamsog::Map::Map.new(@terrain_definition)
    map.place_unit(u1, 2, 5)
    map.place_unit(u2, 3, 6)
    assert_raise(Yamsog::Map::LocationOccupiedException) do
      map.move_unit(2, 5, 3, 6)
    end
  end

  def test_move_unit_exception_no_unit_on_source
    map = Yamsog::Map::Map.new(@terrain_definition)
    assert_raise(Yamsog::Map::NoUnitHereException) do
      map.move_unit(2, 5, 3, 6)
    end
  end

  def test_rep
    map = Yamsog::Map::Map.new(@terrain_definition)
    units = Yamsog::Map::Matrix.new(6, 10)
    
    p = Yamsog::Player::Abstract.new("John Doe")
    u = Yamsog::Unit::Abstract.new(p)
    map.place_unit(u, 2, 5)
    units[2, 5] = u
    
    assert_equal({"terrain" => map.terrain.rep, "units" => map.units.rep}, map.rep)
  end

end
