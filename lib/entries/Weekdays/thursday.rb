require_relative 'weekday'

module Weekdays

  class Thursday < Weekday
    
    def set_range
      ranges = []
      ranges << Range.new(Time.find_zone("UTC").parse('00:00'),
                          Time.find_zone("UTC").parse('05:00'),
                          35)
      ranges << Range.new(Time.find_zone("UTC").parse('05:00'),
                          Time.find_zone("UTC").parse('17:00'),
                          25)
      ranges << Range.new(Time.find_zone("UTC").parse('17:00'),
                          Time.find_zone("UTC").parse('24:00'),
                          35)
      ranges        
    end

  end

end