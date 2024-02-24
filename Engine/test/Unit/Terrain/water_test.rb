class WaterTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Water.new
    assert_equal('w', t.rep)
  end

end
