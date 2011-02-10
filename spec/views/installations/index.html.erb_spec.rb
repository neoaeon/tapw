require 'spec_helper'

describe "installations/index.html.erb" do
  before(:each) do
    assign(:installations, [
      stub_model(Installation,
        :name => "Name",
        :description => "MyText",
        :venue => nil,
        :release => 1,
        :migration => nil
      ),
      stub_model(Installation,
        :name => "Name",
        :description => "MyText",
        :venue => nil,
        :release => 1,
        :migration => nil
      )
    ])
  end

  it "renders a list of installations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
