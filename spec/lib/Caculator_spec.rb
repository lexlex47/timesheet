require 'rails_helper'
require './lib/entries/Caculator'
require 'date'
require 'time'

RSpec.describe Caculator do
  
  let(:caculator) { Caculator.new }

  describe "#amount_caculate" do

    before do
      @start_time = Time.parse('00:00')
      @end_time = Time.parse('24:00')
      @rate = 47
    end

    it "should able to return float value" do
      expect(caculator.amount_caculate(@start_time, @end_time,@rate)).to be_an_instance_of(Float)
    end

  end

end