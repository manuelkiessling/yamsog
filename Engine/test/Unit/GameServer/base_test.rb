module Yamsog
  module GameServer
    
    class BaseTest < Test::Unit::TestCase
      
      def test_initialize
        b = Base.new
        assert_equal(Yamsog::GameServer::Base, b.class)
      end
      
      def test_map_source
        b = Base.new
        b.map_source = "test"
      end
      
      def test_commands_source
        b = Base.new
        b.commands_source = "test"
      end
      
      def test_events_target
        b = Base.new
        b.events_target = "test"
      end
      
      def test_state_target
        b = Base.new
        b.state_target = "test"
      end
      
      def test_map_string_not_implemented
        b = Base.new
        assert_raise(NotImplementedError) do
          b.map_string
        end
      end
      
      def test_map_key_not_implemented
        b = Base.new
        assert_raise(NotImplementedError) do
          b.map_key
        end
      end
      
      def test_map
        b = Base.new
        m_actual = b.map( "fw", { "f" => String, "w" => String } )
        
        mb = Yamsog::Map::MatrixBuilder.new
        t = mb.from_string_with_key( "fw", { "f" => String, "w" => String } )
        m_expected = Yamsog::Map::Map.new(t)
        
        assert_equal(m_expected.terrain.all_positions, m_actual.terrain.all_positions)
      end
      
      def test_get_commands_source_handler
        b = Base.new
        assert_raise(NotImplementedError) do
          b.get_commands_source_handler(nil)
        end
      end
      
      def test_new_commands_available
        b = Base.new
        assert_raise(NotImplementedError) do
          b.new_commands_available(nil)
        end
      end
      
      def test_new_commands
        b = Base.new
        assert_raise(NotImplementedError) do
          b.new_commands(nil)
        end
      end
      
      def test_cleanup_commands_source
        b = Base.new
        assert_raise(NotImplementedError) do
          b.cleanup_commands_source(nil)
        end
      end
            
      def test_write_events
        b = Base.new
        assert_raise(NotImplementedError) do
          b.write_events(nil)
        end
      end
      
      def test_write_state
        b = Base.new
        assert_raise(NotImplementedError) do
          b.write_state(nil)
        end
      end
      
    end
  
  end
end
