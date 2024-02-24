module Yamsog
  module Event

    class Abstract
      
      def initialize(name)
        @event_name = name
        @info = {}
      end
      
      def add_info(key, value)
        @info[key] = value
      end
      
      def to_hash
        ret = {}
        ret["event_name"] = @event_name
        ret.merge @info
      end
      
    end
      
  end
end
