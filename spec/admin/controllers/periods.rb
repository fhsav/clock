require 'spec_helper'

describe "Period API" do
  before(:all) do
    post "/admin/authenticate", :password => password
    schedule = Schedule.create(:name => "Derp")
  end
  
end
