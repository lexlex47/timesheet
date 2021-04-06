require 'rails_helper'
require './lib/entries/Weekdays/sunday'
require 'date'
require 'time'

RSpec.describe Weekdays::Sunday do

  let(:sunday) {Weekdays::Sunday.new(Time.find_zone("UTC").parse("15:30"),
                                         Time.find_zone("UTC").parse("20:00"),
                                         Caculator.new)}
  let(:time_ranges) {sunday.time_ranges}

  describe "#process_range" do
    before do
      sunday.set_range
    end

    it "should able return amount from start_time to finish_time" do
      current_time_range = time_ranges[0]
      # 15:30 - 20:00 * 47
      expect(sunday.process_range(current_time_range)).to eq(211.5)
    end
  end

end