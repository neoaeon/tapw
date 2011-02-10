require "spec_helper"

describe JsonfilesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/jsonfiles" }.should route_to(:controller => "jsonfiles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/jsonfiles/new" }.should route_to(:controller => "jsonfiles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/jsonfiles/1" }.should route_to(:controller => "jsonfiles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/jsonfiles/1/edit" }.should route_to(:controller => "jsonfiles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/jsonfiles" }.should route_to(:controller => "jsonfiles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/jsonfiles/1" }.should route_to(:controller => "jsonfiles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/jsonfiles/1" }.should route_to(:controller => "jsonfiles", :action => "destroy", :id => "1")
    end

  end
end
