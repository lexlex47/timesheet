require 'rails_helper'
require './lib/entries/Weekdays/tuesday'
require 'date'
require 'time'

RSpec.describe Weekdays::Tuesday do

  let(:tuesday) {Weekdays::Tuesday.new(Time.find_zone("UTC").parse("12:00"),
                                       Time.find_zone("UTC").parse("20:15"),
                                       Caculator.new)}
  let(:time_ranges) {tuesday.time_ranges}

  describe "#process_range" do
    before do
      tuesday.set_range
    end

    it "should return 0 if start_time is not covered in current time range" do
      current_time_range = time_ranges.first
      expect(tuesday.process_range(current_time_range)).to eq(0)
    end
    it "should able return amount from start_time to first time range's end time" do
      current_time_range = time_ranges[1]
      # 12:00 - 17:00 * 25
      expect(tuesday.process_range(current_time_range)).to eq(125)
    end
    it "should able return amount from new start_time to finish_time" do
      tuesday.start_time = time_ranges[1].range_end
      current_time_range = time_ranges[2]
      # 17:00 - 20:15 * 35
      expect(tuesday.process_range(current_time_range)).to eq(113.75)
    end
  end

end