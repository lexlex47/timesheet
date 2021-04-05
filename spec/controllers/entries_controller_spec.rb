require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe "Entries#index" do
    it "should return render /index.html.erb" do
      get :index
      assert_template 'entries/index'
    end
  end

  describe "Entries#new" do
    it "should return render /new.html.erb" do
      get :new
      assert_template 'entries/new'
    end
  end

end