require 'date'
require 'time'
require './lib/entries/Processor'

class Entry < ApplicationRecord

  validates :date, :start_time, :finish_time, presence: true
  validate :is_data_valid?
  before_create :get_amount

  def is_data_valid?
    !is_future_date? && !is_time_in_wrong_order? && !is_time_overlap?
  end

  def get_amount
    self.amount = Processor.instance.result_amount(date, start_time, finish_time)
  end

  private

  def is_future_date?
    return false if date <= Date.today
    errors.add(:date, " should in the past.")
    return true
  end

  def is_time_in_wrong_order?
    return false if start_time < finish_time
    errors.add(:start_time, " should before the finish time.")
    return true
  end

  def is_time_overlap?
    Entry.all.each do |entry|
      if date == entry.date
        entry_start = fetch_time(entry.start_time)
        entry_end = fetch_time(entry.finish_time)
        if (entry_start..entry_end).overlaps?(start_time..finish_time)
          errors.add(:base, "Timesheet Entry should not overlapping.")
          return true
        end
      end
    end
    return false
  end

  def fetch_time(time)
    hour = time.hour
    minutes = time.min
    puts Time.find_zone("UTC").parse("#{hour}:#{minutes}")
    Time.find_zone("UTC").parse("#{hour}:#{minutes}")
  end

end
