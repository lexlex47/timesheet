require 'rails_helper'
require 'date'
require 'time'

RSpec.describe Entry, type: :model do
  
  before do
    Entry.destroy_all
  end

  describe "#validation" do
    it "should pass the valid_entry" do
      expect(FactoryBot.build :entry).to be_valid
    end

    it "should fail the entry in the future date" do
      invalid_entry = FactoryBot.build(:entry,
                                        date: "2022-04-15")
      expect(invalid_entry).to be_invalid
    end

    it "should fail the finish time early than start time" do
      invalid_entry = FactoryBot.build(:entry,
                                        start_time: "10:00",
                                        finish_time: "05:00")
      expect(invalid_entry).to be_invalid
    end

    it "should fail the finish time equal to start time" do
      invalid_entry = FactoryBot.build(:entry,
                                        start_time: "10:00",
                                        finish_time: "10:00")
      expect(invalid_entry).to be_invalid
    end
  end

  describe "#get_amount" do
    let(:entry) {FactoryBot.build :entry}
    it "should return a numeric" do
      expect(entry.get_amount).to be_an_instance_of(Integer)
    end
  end

end
