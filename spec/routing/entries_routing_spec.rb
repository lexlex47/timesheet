require 'rails_helper'

describe "Entries routes" do
  
  it "should root to entry index" do
    expect(get '/entries').to route_to('entries#index')
  end

  it "should route to entry create" do
    expect(post '/entries').to route_to('entries#create')
  end

end