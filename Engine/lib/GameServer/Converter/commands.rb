module Yamsog
  module GameServer
    module Converter

      class Commands

        @@command_key = {
          'addplayer' => Yamsog::Command::Addplayer,
          'addunit' => Yamsog::Command::Addunit,
          'attack' => Yamsog::Command::Attack,
          'cancel' => Yamsog::Command::Cancel,
          'goto' => Yamsog::Command::Goto,
        }
        
        def self.convert(command_hashes)
          command_objects = []
          command_hashes.each do |command_hash|
            
            c = @@command_key[command_hash["command"]].new
            if c.class == Yamsog::Command::Goto or c.class == Yamsog::Command::Attack or c.class == Yamsog::Command::Cancel
              c.commander = [Yamsog::Player, player_id(command_hash["commander"])]
              c.receiver = [Yamsog::Unit, unit_id(command_hash["receiver"])]
              if c.class == Yamsog::Command::Goto or c.class == Yamsog::Command::Attack
                c.row, c.col = command_hash["row"].to_i, command_hash["col"].to_i
              end
            end
            
            if c.class == Yamsog::Command::Addplayer
              c.commander = nil
              c.receiver = nil
              c.player_name = command_hash["player_name"]
            end
            
            if c.class == Yamsog::Command::Addunit
              
              unit_key = {
                'soldier' => Yamsog::Unit::Soldier
              }
              
              c.receiver = nil
              c.commander = [Yamsog::Player, player_id(command_hash["commander"])]
              c.unit_type = unit_key[command_hash["unit_type"]]
              c.row, c.col = command_hash["row"].to_i, command_hash["col"].to_i              
            end
            
           command_objects.push c
            
          end
          command_objects
        end
        
        protected
        
        def self.player_id(string)
          string.split("")[6..99].to_s.to_i
        end
        
        def self.unit_id(string)
          string.split("")[4..99].to_s.to_i
        end
        
      end
      
    end
  end
end
