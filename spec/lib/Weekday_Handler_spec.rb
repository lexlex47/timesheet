require 'rails_helper'
require './lib/entries/Weekday_Handler'
require 'date'
require 'time'

RSpec.describe Weekday_Handler do

  describe "#initialize" do
    it "should take four arguments" do
      expect(Weekday_Handler).to respond_to(:new).with(4).argument
    end
  end

  describe "methods" do
    before do 
      entry = FactoryBot.build :entry
      caculator = Caculator.new
      @weekday_handler = Weekday_Handler.new(entry.date,
                                             entry.start_time,
                                             entry.finish_time, 
                                             caculator)
    end
    context "#weekday_create" do
      it "should able return a numeric" do
        expect(@weekday_handler.weekday_create).to be_an_instance_of(Integer)
      end
    end
    context "#weekday_name" do
      it "should return a string" do
        expect(@weekday_handler.weekday_name).to be_an_instance_of(String)
      end
    end
  end

end