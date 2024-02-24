class PlainTest < Test::Unit::TestCase

  def test_get_rep
    t = Yamsog::Terrain::Plain.new
    assert_equal('p', t.rep)
  end

end
