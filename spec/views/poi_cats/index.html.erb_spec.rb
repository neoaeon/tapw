require 'spec_helper'

describe "poi_cats/index.html.erb" do
  before(:each) do
    assign(:poi_cats, [
      stub_model(PoiCat,
        :uid => 1,
        :mapuid => 1,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(PoiCat,
        :uid => 1,
        :mapuid => 1,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of poi_cats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
