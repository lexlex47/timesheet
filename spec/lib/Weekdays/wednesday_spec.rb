require 'rails_helper'
require './lib/entries/Weekdays/wednesday'
require 'date'
require 'time'

RSpec.describe Weekdays::Wednesday do

  let(:wednesday) {Weekdays::Wednesday.new(Time.find_zone("UTC").parse("04:00"),
                                           Time.find_zone("UTC").parse("21:30"),
                                           Caculator.new)}
  let(:time_ranges) {wednesday.time_ranges}

  describe "#process_range" do
    before do
      wednesday.set_range
    end

    it "should able return amount from start_time to first time range's end time" do
      current_time_range = time_ranges[0]
      # 04:00 - 07:00 * 33
      expect(wednesday.process_range(current_time_range)).to eq(99)
    end

    it "should able return amount from new start_time to second time range's end time" do
      wednesday.start_time = time_ranges[0].range_end
      current_time_range = time_ranges[1]
      # 07:00 - 19:00 * 22
      expect(wednesday.process_range(current_time_range)).to eq(264)
    end

    it "should able return amount from new start_time to finish_time" do
      wednesday.start_time = time_ranges[1].range_end
      current_time_range = time_ranges.last
      # 19:00 - 21:30 * 33
      expect(wednesday.process_range(current_time_range)).to eq(82.5)
    end

  end

end