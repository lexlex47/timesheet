require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe "Entries#index" do
    it "should return render /index.html.erb" do
      get :index
      assert_template 'entries/index'
    end

    it "should return success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "should return proper entries numbers" do
      FactoryBot.create :entry
      FactoryBot.create(:entry, date: "2020-04-15")
      get :index
      expect(Entry.recent.length).to eq(2)
    end

    it "should return entries in the proper order" do
      old_entry = FactoryBot.create :entry
      new_entry = FactoryBot.create(:entry, date: "2020-04-15")
      get :index
      expect(Entry.recent.first['date']).to eq(new_entry.date)
      expect(Entry.recent.last['date']).to eq(old_entry.date)
    end

  end

  describe "Entries#new" do
    it "should return render /new.html.erb" do
      get :new
      assert_template 'entries/new'
    end
  end

  describe "Entries#create" do
    context "with valid params" do
      it "should return to root if successful" do
        entry_attributes = FactoryBot.attributes_for(:entry)
        post :create, params: {entry: entry_attributes}
        expect(response).to redirect_to(root_path)
      end
      it "should create a entry with valid params" do
        entry_attributes = FactoryBot.attributes_for(:entry)
        expect {post :create, params: {entry: entry_attributes}}.to change{ Entry.count }.by(1)
      end
    end

    context "with invalid params" do
      it "should redirect to current action if failure" do
        entry_attributes = FactoryBot.attributes_for(:entry, date: "2022-04-15")
        post :create, params: {entry: entry_attributes}
        expect(response).to redirect_to(new_entry_path)
      end
    end
  end

  describe "Entries#update" do
    let(:entry) {FactoryBot.create :entry}
    let(:valid_update_attributes) do
      {
        entry:{
          date: '2001-04-15'
        }
      }
    end
    let(:invalid_update_attributes) do
      {
        entry:{
          date: '2030-04-15'
        }
      }
    end
    context "with valid params" do
      it "should update the entry attributes" do
        patch :update, params: valid_update_attributes.merge(id: entry.id)
        expect(entry.reload.date).to eq(Date.new(2001,04,15))
      end
    end
    context "with invalid params" do
      it "should not change the entry attributes" do
        expect{patch :update, params: invalid_update_attributes.merge(id: entry.id)}.to raise_error
        expect(entry.reload.date).to eq(entry.date)
      end
    end
  end

end