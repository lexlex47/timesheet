require 'time'
require 'date'
require_relative '../Range.rb'

module Weekdays

  class Weekday

    attr_accessor :start_time,
                  :finish_time,
                  :caculator,
                  :time_ranges

    def initialize(start_time, finish_time, caculator)
      @start_time = start_time
      @finish_time = finish_time
      @caculator = caculator

      @time_ranges = set_range
    end

    def set_range
      []
    end

    def process
      return 0 if @time_ranges.empty?
      total = 0
      @time_ranges.each do |range|
        total += process_range(range)
      end
      total
    end

    def process_range(range)
      return 0 if !(range.range_start..range.range_end).cover?(@start_time)
      if(range.range_start..range.range_end).cover?(@finish_time)
        return @caculator.amount_caculate(@start_time, @finish_time, range.rate)
      end
      amount = @caculator.amount_caculate(@start_time, range.range_end, range.rate)
      @start_time = range.range_end
      return amount
    end
    
  end

end