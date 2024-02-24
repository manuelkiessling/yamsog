module Yamsog
  module Map
    
    class MatrixBuilder
      
      def from_string_with_key(string, key)
        rows = string.split("\n")
        rows.collect! { |row| row.gsub(/\s+/, '').split(//) }
        
        number_of_rows = rows.size
        number_of_cols = rows[0].size

        terrain_matrix = Matrix.new(number_of_rows, number_of_cols)
        
        rows.each_with_index do |row, row_number|
          row.each_with_index do |glyph, column_number|
            terrain_matrix[row_number, column_number] = key[glyph]
          end
        end
        
        terrain_matrix
      end
     
    end
  
  end
end
