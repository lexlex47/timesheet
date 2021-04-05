require 'time'
require 'date'
require 'singleton'
require_relative 'Weekday_Handler'
require_relative 'Caculator'

class Processor

  include Singleton

  def initialize()
    @caculator = Caculator.new
  end

  def result_amount(date, start_time, finish_time)
    weekday = Weekday_Handler.new(date, start_time, finish_time, @caculator)
    amount = weekday.weekday_create
    amount
  end

end