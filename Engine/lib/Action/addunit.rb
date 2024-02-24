module Yamsog
  module Action

    class Addunit < Abstract
      
      def loop
        if not finished?
          u = @command.unit_type.new(@game.player_by_id(@command.commander[1]))
          @game.map.place_unit(u, @command.row, @command.col)
          @events = []
          e = Yamsog::Event::Abstract.new("unit_added")
          e.add_info("player_id", @game.player_by_id(@command.commander[1]).id)
          e.add_info("unit_type", u.rep_name)
          @events.push e
          finished!
          return true
        end
        return false
      end
      
    end
      
  end
end
