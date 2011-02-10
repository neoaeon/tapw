require 'spec_helper'

describe "PoiCats" do
  describe "GET /poi_cats" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get poi_cats_path
      response.status.should be(200)
    end
  end
end
