require 'spec_helper'

describe "jsonfiles/show.html.erb" do
  before(:each) do
    @jsonfile = assign(:jsonfile, stub_model(Jsonfile,
      :filename => "Filename",
      :description => "MyText",
      :jsonparse => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Filename/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
