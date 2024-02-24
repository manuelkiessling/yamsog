class MatrixBuilderTest < Test::Unit::TestCase

  def test_create_from_string
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
    
    mi = Yamsog::Map::MatrixBuilder.new
    matrix = mi.from_string_with_key(string, key)
    assert_equal(Yamsog::Terrain::Forest, matrix[2, 9])
  end

end
