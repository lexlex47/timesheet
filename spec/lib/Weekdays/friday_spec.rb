require 'rails_helper'
require './lib/entries/Weekdays/friday'
require 'date'
require 'time'

RSpec.describe Weekdays::Friday do

  let(:friday) {Weekdays::Friday.new(Time.find_zone("UTC").parse("10:00"),
                                     Time.find_zone("UTC").parse("17:00"),
                                     Caculator.new)}
  let(:time_ranges) {friday.time_ranges}

  describe "#process_range" do
    before do
      friday.set_range
    end

    it "should return 0 if start_time is not covered in current time range" do
      current_time_range = time_ranges.first
      expect(friday.process_range(current_time_range)).to eq(0)
    end
    it "should able return amount from start_time to finish_time" do
      current_time_range = time_ranges[1]
      # 10:00 - 17:00 * 22
      expect(friday.process_range(current_time_range)).to eq(154)
    end
  end

end