require 'spec_helper'

describe "jsonfiles/index.html.erb" do
  before(:each) do
    assign(:jsonfiles, [
      stub_model(Jsonfile,
        :filename => "Filename",
        :description => "MyText",
        :jsonparse => "MyText"
      ),
      stub_model(Jsonfile,
        :filename => "Filename",
        :description => "MyText",
        :jsonparse => "MyText"
      )
    ])
  end

  it "renders a list of jsonfiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
