require 'spec_helper'

describe "map_types/edit.html.erb" do
  before(:each) do
    @map_type = assign(:map_type, stub_model(MapType,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit map_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => map_type_path(@map_type), :method => "post" do
      assert_select "input#map_type_name", :name => "map_type[name]"
      assert_select "textarea#map_type_description", :name => "map_type[description]"
    end
  end
end
