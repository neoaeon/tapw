require 'spec_helper'

describe "CalEventCats" do
  describe "GET /cal_event_cats" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cal_event_cats_path
      response.status.should be(200)
    end
  end
end
