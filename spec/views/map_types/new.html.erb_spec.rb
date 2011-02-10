require 'spec_helper'

describe "map_types/new.html.erb" do
  before(:each) do
    assign(:map_type, stub_model(MapType,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new map_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => map_types_path, :method => "post" do
      assert_select "input#map_type_name", :name => "map_type[name]"
      assert_select "textarea#map_type_description", :name => "map_type[description]"
    end
  end
end
