class GrassTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Grass.new
    assert_equal('g', t.rep)
  end

end
