class ForestTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Forest.new
    assert_equal('f', t.rep)
  end

end
