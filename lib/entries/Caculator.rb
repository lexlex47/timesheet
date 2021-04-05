require 'time'
require 'date'

class Caculator

  def initialize
  end

  def amount_caculate(start_time, end_time, rate)
    (end_time - start_time) / 3600 * rate
  end

end