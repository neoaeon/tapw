require "spec_helper"

describe MapImagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/map_images" }.should route_to(:controller => "map_images", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/map_images/new" }.should route_to(:controller => "map_images", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/map_images/1" }.should route_to(:controller => "map_images", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/map_images/1/edit" }.should route_to(:controller => "map_images", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/map_images" }.should route_to(:controller => "map_images", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/map_images/1" }.should route_to(:controller => "map_images", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/map_images/1" }.should route_to(:controller => "map_images", :action => "destroy", :id => "1")
    end

  end
end
