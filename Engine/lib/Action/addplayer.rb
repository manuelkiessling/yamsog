module Yamsog
  module Action

    class Addplayer < Abstract
      
      def loop
        if not finished?
          p = Yamsog::Player::Abstract.new(@command.player_name)
          @game.add_player(p)
          @events = []
          e = Yamsog::Event::Abstract.new("player_added")
          e.add_info("player_name", p.name)
          e.add_info("player_id", p.id)
          @events.push e
          finished!
          return true
        end
        return false
      end
      
    end
      
  end
end
