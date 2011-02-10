require 'spec_helper'

describe "cal_event_cats/show.html.erb" do
  before(:each) do
    @cal_event_cat = assign(:cal_event_cat, stub_model(CalEventCat,
      :uid => 1,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
