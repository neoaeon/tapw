require "spec_helper"

describe InstallationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/installations" }.should route_to(:controller => "installations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/installations/new" }.should route_to(:controller => "installations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/installations/1" }.should route_to(:controller => "installations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/installations/1/edit" }.should route_to(:controller => "installations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/installations" }.should route_to(:controller => "installations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/installations/1" }.should route_to(:controller => "installations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/installations/1" }.should route_to(:controller => "installations", :action => "destroy", :id => "1")
    end

  end
end
