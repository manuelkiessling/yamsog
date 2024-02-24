$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib/active_support/vendor/i18n-0.3.7")
$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib/active_support/vendor/tzinfo-0.3.12")
$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib/active_support/vendor/memcache-client-1.7.4")
$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib/active_support/vendor/builder-2.1.2")
$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/bin")
$:.push("/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib")
$:.push("/Library/Ruby/Gems/1.8/gems/hpricot-0.8.2/bin")
$:.push("/Library/Ruby/Gems/1.8/gems/hpricot-0.8.2/lib")

require '/Library/Ruby/Gems/1.8/gems/activesupport-2.3.8/lib/active_support.rb'
module Yamsog
  module GameServer

    class Localfile < Base 

      def initialize()
        super
      end

      def map_string
        string = ""
        File.open(@map_source) do |file|
          while line = file.gets
            string = string + line
          end
        end
        return string
      end
      
      def map_key
        return {
         Yamsog::Terrain::Forest.new().shortname => Yamsog::Terrain::Forest,
         Yamsog::Terrain::Grass.new().shortname => Yamsog::Terrain::Grass,
         Yamsog::Terrain::Mountain.new().shortname => Yamsog::Terrain::Mountain,
         Yamsog::Terrain::Plain.new().shortname => Yamsog::Terrain::Plain,
         Yamsog::Terrain::Water.new().shortname => Yamsog::Terrain::Water
        }
      end
      
      def get_commands_source_handler(commands_source)
        return File.open(commands_source, File::RDWR)
      end
      
      def new_commands_available(file_handler)
        file_handler.rewind
        return file_handler.lines.count > 0
      end
      
      def new_commands(file_handler)
        file_handler.rewind
        string = ""
        while line = file_handler.gets
          string = string + line
        end
        begin
          commands = ActiveSupport::JSON::decode(string)
        rescue StandardError
          e = CorruptCommandsInSourceException.new
          e.corrupt_commands = string
          raise e
        end
        if (commands == false)
          raise CommandSourceEmptyException
        end
        return commands
      end
      
      def cleanup_commands_source(file_handler)
        file_handler.rewind
        file_handler.truncate(0)
      end
      
      def write_state(state)
        f = File.open(@state_target, "w")
        f.write(state.to_json)
        f.close
        p state
      end
      
      def write_events(events)
        true
      end

    end
      
  end
end
