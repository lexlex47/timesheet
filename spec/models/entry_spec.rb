require 'rails_helper'
require 'date'
require 'time'

RSpec.describe Entry, type: :model do
  
  describe "#validation" do
    it "should pass the valid_entry" do
      expect(FactoryBot.build :valid_entry).to be_valid
    end
  end

end
