require_relative 'weekday'

module Weekdays

  class Saturday < Weekday
    
    def set_range
      ranges = []
      ranges << Range.new(Time.find_zone("UTC").parse('00:00'),
                          Time.find_zone("UTC").parse('24:00'),
                          47)
      ranges        
    end

  end

end