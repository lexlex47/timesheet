require 'rails_helper'
require './lib/entries/Weekdays/weekday'
require 'date'
require 'time'

RSpec.describe Weekdays::Weekday do

  let(:weekday) {Weekdays::Weekday.new(Time.find_zone("UTC").parse("12:00"),
                                       Time.find_zone("UTC").parse("20:15"),
                                       Caculator.new)}
  let(:time_ranges) {weekday.time_ranges}

  describe "#initialize" do
    it "should take three arguments" do
      expect(Weekdays::Weekday).to respond_to(:new).with(3).argument
    end
  end

  describe "methods" do
    context "#process" do
      it "should return 0 if time_ranges is empty" do
        expect(weekday.process).to eq(0)
      end
    end

    context "#process_range" do
      before do
        time_ranges << Range.new(Time.find_zone("UTC").parse('00:00'),
                            Time.find_zone("UTC").parse('05:00'),
                            35)
        time_ranges << Range.new(Time.find_zone("UTC").parse('05:00'),
                            Time.find_zone("UTC").parse('17:00'),
                            25)
        time_ranges << Range.new(Time.find_zone("UTC").parse('17:00'),
                            Time.find_zone("UTC").parse('24:00'),
                            35) 
      end
      it "should time_ranges contain Range instances" do
        time_ranges.each do |time_ranges|
          expect(time_ranges).to be_an_instance_of(Range)
        end
      end
      it "should return 0 if start_time is not covered in current time range" do
        current_time_range = time_ranges.first
        expect(weekday.process_range(current_time_range)).to eq(0)
      end
      it "should able return amount from start_time to current time range's end time" do
        current_time_range = time_ranges[1]
        # 12:00 - 17:00 * 25
        expect(weekday.process_range(current_time_range)).to eq(125)
      end
      it "should change original start_time to the current time range's end time" do
        current_time_range = time_ranges[1]
        weekday.process_range(current_time_range)
        expect(weekday.start_time).to eq(current_time_range.range_end)
      end
      it "should able return amount from curren time range's start time to finish time" do
        weekday.start_time = time_ranges[1].range_end
        current_time_range = time_ranges[2]
        # 17:00 - 20:15 * 35
        expect(weekday.process_range(current_time_range)).to eq(113.75)
      end
    end
  end

end