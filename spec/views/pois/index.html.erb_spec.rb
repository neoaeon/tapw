require 'spec_helper'

describe "pois/index.html.erb" do
  before(:each) do
    assign(:pois, [
      stub_model(Poi,
        :uid => 1,
        :name => "Name",
        :description => "MyText",
        :poi_cat => 1,
        :lattitude => "9.99",
        :longitude => "9.99"
      ),
      stub_model(Poi,
        :uid => 1,
        :name => "Name",
        :description => "MyText",
        :poi_cat => 1,
        :lattitude => "9.99",
        :longitude => "9.99"
      )
    ])
  end

  it "renders a list of pois" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
