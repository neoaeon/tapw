require 'spec_helper'

describe "installations/new.html.erb" do
  before(:each) do
    assign(:installation, stub_model(Installation,
      :name => "MyString",
      :description => "MyText",
      :venue => nil,
      :release => 1,
      :migration => nil
    ).as_new_record)
  end

  it "renders new installation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => installations_path, :method => "post" do
      assert_select "input#installation_name", :name => "installation[name]"
      assert_select "textarea#installation_description", :name => "installation[description]"
      assert_select "input#installation_venue", :name => "installation[venue]"
      assert_select "input#installation_release", :name => "installation[release]"
      assert_select "input#installation_migration", :name => "installation[migration]"
    end
  end
end
