require 'time'
require 'date'

class Range

  attr_accessor :range_start,
                :range_end,
                :rate

  def initialize(range_start, range_end, rate)
    @range_start = range_start
    @range_end = range_end
    @rate = rate
  end

end