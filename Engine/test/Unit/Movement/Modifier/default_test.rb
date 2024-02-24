class DefaultTest < Test::Unit::TestCase
  
  def test_penalty
    f = Yamsog::Movement::Modifier::Default.new(-75.0)
    assert_equal(2.5, f.get_modified_speed_of(Yamsog::Movement::Walk.new))
  end
  
  def test_bonus
    f = Yamsog::Movement::Modifier::Default.new(100.0)
    assert_equal(20.0, f.get_modified_speed_of(Yamsog::Movement::Walk.new))
  end
    
  def test_exception_if_penalty_is_too_high
    assert_raise(Yamsog::Movement::Modifier::Exception) do
      f = Yamsog::Movement::Modifier::Default.new(-100.000001)
    end
  end

end
