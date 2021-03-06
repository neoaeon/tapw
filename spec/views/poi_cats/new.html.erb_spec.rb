require 'spec_helper'

describe "poi_cats/new.html.erb" do
  before(:each) do
    assign(:poi_cat, stub_model(PoiCat,
      :uid => 1,
      :mapuid => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new poi_cat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => poi_cats_path, :method => "post" do
      assert_select "input#poi_cat_uid", :name => "poi_cat[uid]"
      assert_select "input#poi_cat_mapuid", :name => "poi_cat[mapuid]"
      assert_select "input#poi_cat_name", :name => "poi_cat[name]"
      assert_select "textarea#poi_cat_description", :name => "poi_cat[description]"
    end
  end
end
