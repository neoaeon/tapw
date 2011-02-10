require "spec_helper"

describe PoisController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pois" }.should route_to(:controller => "pois", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pois/new" }.should route_to(:controller => "pois", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pois/1" }.should route_to(:controller => "pois", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pois/1/edit" }.should route_to(:controller => "pois", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pois" }.should route_to(:controller => "pois", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pois/1" }.should route_to(:controller => "pois", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pois/1" }.should route_to(:controller => "pois", :action => "destroy", :id => "1")
    end

  end
end
