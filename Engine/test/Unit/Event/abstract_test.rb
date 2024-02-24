module Yamsog
  module Event

    class AbstractTest < Test::Unit::TestCase

      def test_to_hash
        e = Abstract.new("my_event")
        e.add_info("info1", 1234)
        e.add_info("info 2", "hello world")
        
        assert_equal({"event_name" => "my_event", "info1" => 1234, "info 2" => "hello world"}, e.to_hash)
      end

    end

  end
end
