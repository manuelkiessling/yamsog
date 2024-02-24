module Yamsog
  module Command

    class AddplayerTest < Test::Unit::TestCase
              
      def test_create
        c = Addplayer.new()
        c.player_name = "John Doe"
        assert_equal([nil, nil, "John Doe"], [c.commander, c.receiver, c.player_name])
      end
            
    end
      
  end
end
