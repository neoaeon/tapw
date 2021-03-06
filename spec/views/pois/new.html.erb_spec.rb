require 'spec_helper'

describe "pois/new.html.erb" do
  before(:each) do
    assign(:poi, stub_model(Poi,
      :uid => 1,
      :name => "MyString",
      :description => "MyText",
      :poi_cat => 1,
      :lattitude => "9.99",
      :longitude => "9.99"
    ).as_new_record)
  end

  it "renders new poi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pois_path, :method => "post" do
      assert_select "input#poi_uid", :name => "poi[uid]"
      assert_select "input#poi_name", :name => "poi[name]"
      assert_select "textarea#poi_description", :name => "poi[description]"
      assert_select "input#poi_poi_cat", :name => "poi[poi_cat]"
      assert_select "input#poi_lattitude", :name => "poi[lattitude]"
      assert_select "input#poi_longitude", :name => "poi[longitude]"
    end
  end
end
