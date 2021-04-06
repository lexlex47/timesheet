require 'rails_helper'
require './lib/entries/Processor'
require 'date'
require 'time'

RSpec.describe Processor do

  let(:processor) {Processor.instance}

  before do
    Singleton.__init__(Processor)
  end

  describe "#initialize" do
    it "should Processor is a singleton instance" do
      expect(Processor.instance) == "is a Singleton"
    end

    it "should create an Caculator instance" do
      expect(processor.caculator).to be_an_instance_of(Caculator)
    end
  end

  describe "#result_amount" do
    it "should take three arguments" do
      expect(processor).to respond_to(:result_amount).with(3).argument
    end

    it "should able to return a float value" do
      date = Date.new(2019,04,16)
      start_time = Time.find_zone("UTC").parse("12:00")
      finish_time = Time.find_zone("UTC").parse("20:15")
      value = processor.result_amount(date,start_time,finish_time)
      expect(value).to be_an_instance_of(Float)                   
    end
  end

end