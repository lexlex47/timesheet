require 'time'
require 'date'

require_relative 'Weekdays/monday'
require_relative 'Weekdays/tuesday'
require_relative 'Weekdays/wednesday'
require_relative 'Weekdays/thursday'
require_relative 'Weekdays/friday'
require_relative 'Weekdays/saturday'
require_relative 'Weekdays/sunday'

class Weekday_Handler

  attr_accessor :date,
                :start_time,
                :finish_time,
                :caculator

  def initialize(date, start_time, finish_time, caculator)
    @date = date
    @start_time = start_time
    @finish_time = finish_time
    @caculator = caculator 
  end

  def weekday_create
    @weekday = Object.const_get("Weekdays::#{weekday_name.capitalize}")
    @weekday.new(start_time, finish_time, caculator).process
  end

  def weekday_name
    @date.strftime('%A').downcase
  end

end