require "spec_helper"

describe PoiCatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/poi_cats" }.should route_to(:controller => "poi_cats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/poi_cats/new" }.should route_to(:controller => "poi_cats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/poi_cats/1" }.should route_to(:controller => "poi_cats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/poi_cats/1/edit" }.should route_to(:controller => "poi_cats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/poi_cats" }.should route_to(:controller => "poi_cats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/poi_cats/1" }.should route_to(:controller => "poi_cats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/poi_cats/1" }.should route_to(:controller => "poi_cats", :action => "destroy", :id => "1")
    end

  end
end
