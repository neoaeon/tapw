require "spec_helper"

describe MapTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/map_types" }.should route_to(:controller => "map_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/map_types/new" }.should route_to(:controller => "map_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/map_types/1" }.should route_to(:controller => "map_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/map_types/1/edit" }.should route_to(:controller => "map_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/map_types" }.should route_to(:controller => "map_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/map_types/1" }.should route_to(:controller => "map_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/map_types/1" }.should route_to(:controller => "map_types", :action => "destroy", :id => "1")
    end

  end
end
