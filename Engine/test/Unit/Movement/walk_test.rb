class WalkTest < Test::Unit::TestCase
  
  def test_default_speed
    m = Yamsog::Movement::Walk.new
    assert_equal(10.0, m.get_speed)
  end
  
  def test_changed_speed
    m = Yamsog::Movement::Walk.new
    m.change_default_speed_by!(200.0)
    assert_equal(20.0, m.get_speed)
  end

end
