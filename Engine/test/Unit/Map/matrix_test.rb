class MatrixTest < Test::Unit::TestCase
  
  def test_all_positions
    matrix = Yamsog::Map::Matrix.new(3, 2)
    assert_equal([[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1]], matrix.all_positions)
  end

  def test_number_of_rows
    matrix = Yamsog::Map::Matrix.new(2, 7)
    assert_equal(2, matrix.number_of_rows)
  end
  
  def test_number_of_cols
    matrix = Yamsog::Map::Matrix.new(2, 7)
    assert_equal(7, matrix.number_of_cols)
  end
  
  def test_rep
    matrix = Yamsog::Map::Matrix.new(1, 1)
    t = Yamsog::Terrain::Forest.new
    matrix[0, 0] = t
    assert_equal([[t.rep]], matrix.rep)
  end
  
  def test_rep_nil_if_matrix_empty
    matrix = Yamsog::Map::Matrix.new(1, 2)
    assert_equal([[nil, nil]], matrix.rep)
  end
  
end
