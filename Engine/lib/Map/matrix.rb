module Yamsog
  module Map
    
    class Matrix
      
      def initialize(rows, cols)
        @cols = cols
        @rows = rows
        @data = []
        rows.times do |row|
          @data[row] = Array.new(cols)
        end
      end

      def [](row, col) @data[row][col]
      end
      
      def []=(row, col, value) @data[row][col] = value
      end
    
      def all_positions
        (0...@rows).collect do |row|
          (0...@cols).collect do |col|
            [row, col]
          end
        end.inject([]) {|a, b| a.concat b}
      end
      
      def number_of_rows
        @rows
      end
      
      def number_of_cols
        @cols
      end
      
      def rep
        @data.collect do |row|
          row.collect do |item|
            item.rep
          end
        end
      end
      
    end
  
  end
end
