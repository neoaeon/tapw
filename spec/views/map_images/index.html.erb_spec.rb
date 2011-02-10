require 'spec_helper'

describe "map_images/index.html.erb" do
  before(:each) do
    assign(:map_images, [
      stub_model(MapImage,
        :mapType => "Map Type",
        :uid => 1,
        :name => "Name",
        :description => "MyText",
        :low_left_lat => "9.99",
        :low_left_long => "9.99",
        :up_left_lat => "9.99",
        :up_left_long => "9.99",
        :up_right_lat => "9.99",
        :up_right_long => "9.99",
        :low_right_lat => "9.99",
        :low_right_long => "9.99"
      ),
      stub_model(MapImage,
        :mapType => "Map Type",
        :uid => 1,
        :name => "Name",
        :description => "MyText",
        :low_left_lat => "9.99",
        :low_left_long => "9.99",
        :up_left_lat => "9.99",
        :up_left_long => "9.99",
        :up_right_lat => "9.99",
        :up_right_long => "9.99",
        :low_right_lat => "9.99",
        :low_right_long => "9.99"
      )
    ])
  end

  it "renders a list of map_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Map Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
