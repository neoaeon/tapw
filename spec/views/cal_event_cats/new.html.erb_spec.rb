require 'spec_helper'

describe "cal_event_cats/new.html.erb" do
  before(:each) do
    assign(:cal_event_cat, stub_model(CalEventCat,
      :uid => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new cal_event_cat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cal_event_cats_path, :method => "post" do
      assert_select "input#cal_event_cat_uid", :name => "cal_event_cat[uid]"
      assert_select "input#cal_event_cat_name", :name => "cal_event_cat[name]"
      assert_select "textarea#cal_event_cat_description", :name => "cal_event_cat[description]"
    end
  end
end
