module Yamsog
  module Map
    
    class Map
      attr_reader :terrain, :units
      
      def initialize(terrain_definition)
        @terrain = Matrix.new(terrain_definition.number_of_rows, terrain_definition.number_of_cols)
        terrain.number_of_rows.times do |row|
          terrain.number_of_cols.times do |col|
            @terrain[row, col] = terrain_definition[row, col].new
          end
        end
        @units = Matrix.new(terrain_definition.number_of_rows, terrain_definition.number_of_cols)
      end
      
      def all_positions
        @terrain.all_positions
      end
      
      def self.within?(distance, row1, col1, row2, col2)
        (row1 - row2).abs + (col1 - col2).abs <= distance
      end

      def place_unit(unit, row, col)
        raise LocationOccupiedException.new() if @units[row, col]
        @units[row, col] = unit
        unit.row = row
        unit.col = col
      end
      
      def move_unit(source_row, source_col, target_row, target_col)
        raise LocationOccupiedException.new() if @units[target_row, target_col]
        raise NoUnitHereException.new() if @units[source_row, source_col].nil?
        @units[target_row, target_col] = @units[source_row, source_col]
        @units[target_row, target_col].row = target_row
        @units[target_row, target_col].col = target_col
        @units[source_row, source_col] = nil
      end
      
      def rep
        return {"terrain" => @terrain.rep, "units" => @units.rep}
      end
      
    end
    
    class LocationOccupiedException < Exception; end
    class NoUnitHereException < Exception; end
  
  end
end
