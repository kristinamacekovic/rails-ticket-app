module TicketsHelper

    def get_hours time_diff
        time_diff = time_diff.round.abs
        hours = time_diff / 3600
        hours
    end

end
