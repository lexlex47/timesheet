require_relative 'weekday'

module Weekdays

  class Wednesday < Weekday
    
    def set_range
      ranges = []
      ranges << Range.new(Time.find_zone("UTC").parse('00:00'),
                          Time.find_zone("UTC").parse('07:00'),
                          33)
      ranges << Range.new(Time.find_zone("UTC").parse('07:00'),
                          Time.find_zone("UTC").parse('19:00'),
                          22)
      ranges << Range.new(Time.find_zone("UTC").parse('19:00'),
                          Time.find_zone("UTC").parse('24:00'),
                          33)
      ranges        
    end

  end

end