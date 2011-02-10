require 'spec_helper'

describe "jsonfiles/edit.html.erb" do
  before(:each) do
    @jsonfile = assign(:jsonfile, stub_model(Jsonfile,
      :filename => "MyString",
      :description => "MyText",
      :jsonparse => "MyText"
    ))
  end

  it "renders the edit jsonfile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jsonfile_path(@jsonfile), :method => "post" do
      assert_select "input#jsonfile_filename", :name => "jsonfile[filename]"
      assert_select "textarea#jsonfile_description", :name => "jsonfile[description]"
      assert_select "textarea#jsonfile_jsonparse", :name => "jsonfile[jsonparse]"
    end
  end
end
