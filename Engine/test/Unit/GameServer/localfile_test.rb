module Yamsog
  module GameServer
    
    class LocalfileTest < Test::Unit::TestCase
      
      def test_initialize
        b = Localfile.new
        assert_equal(Yamsog::GameServer::Localfile, b.class)
      end
      
      def test_map_string
        b = Localfile.new
        begin
          b.map_source = "../../test/fixtures/GameServer/localfile_map.txt"
          actual = b.map_string
        rescue
          b.map_source = "./test/fixtures/GameServer/localfile_map.txt"
          actual = b.map_string
        end
        expected = "fwpmg\npfwgm"
        assert_equal(expected, actual)
      end

    end
  
  end
end
