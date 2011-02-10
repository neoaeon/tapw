require 'spec_helper'

describe "map_images/edit.html.erb" do
  before(:each) do
    @map_image = assign(:map_image, stub_model(MapImage,
      :mapType => "MyString",
      :uid => 1,
      :name => "MyString",
      :description => "MyText",
      :low_left_lat => "9.99",
      :low_left_long => "9.99",
      :up_left_lat => "9.99",
      :up_left_long => "9.99",
      :up_right_lat => "9.99",
      :up_right_long => "9.99",
      :low_right_lat => "9.99",
      :low_right_long => "9.99"
    ))
  end

  it "renders the edit map_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => map_image_path(@map_image), :method => "post" do
      assert_select "input#map_image_mapType", :name => "map_image[mapType]"
      assert_select "input#map_image_uid", :name => "map_image[uid]"
      assert_select "input#map_image_name", :name => "map_image[name]"
      assert_select "textarea#map_image_description", :name => "map_image[description]"
      assert_select "input#map_image_low_left_lat", :name => "map_image[low_left_lat]"
      assert_select "input#map_image_low_left_long", :name => "map_image[low_left_long]"
      assert_select "input#map_image_up_left_lat", :name => "map_image[up_left_lat]"
      assert_select "input#map_image_up_left_long", :name => "map_image[up_left_long]"
      assert_select "input#map_image_up_right_lat", :name => "map_image[up_right_lat]"
      assert_select "input#map_image_up_right_long", :name => "map_image[up_right_long]"
      assert_select "input#map_image_low_right_lat", :name => "map_image[low_right_lat]"
      assert_select "input#map_image_low_right_long", :name => "map_image[low_right_long]"
    end
  end
end
