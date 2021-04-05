require 'rails_helper'
require './lib/entries/Range'
require 'date'
require 'time'

RSpec.describe Range do

  describe "#initialize" do
    it "should take three arguments" do
      expect(Range).to respond_to(:new).with(3).argument
    end
  end

end