class MountainTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Mountain.new
    assert_equal('m', t.rep)
  end

end
