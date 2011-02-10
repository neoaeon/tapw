require 'spec_helper'

describe "venues/edit.html.erb" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :uid => 1,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => venue_path(@venue), :method => "post" do
      assert_select "input#venue_uid", :name => "venue[uid]"
      assert_select "input#venue_name", :name => "venue[name]"
      assert_select "textarea#venue_description", :name => "venue[description]"
    end
  end
end
