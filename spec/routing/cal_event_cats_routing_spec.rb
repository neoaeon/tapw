require "spec_helper"

describe CalEventCatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cal_event_cats" }.should route_to(:controller => "cal_event_cats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cal_event_cats/new" }.should route_to(:controller => "cal_event_cats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cal_event_cats/1" }.should route_to(:controller => "cal_event_cats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cal_event_cats/1/edit" }.should route_to(:controller => "cal_event_cats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cal_event_cats" }.should route_to(:controller => "cal_event_cats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cal_event_cats/1" }.should route_to(:controller => "cal_event_cats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cal_event_cats/1" }.should route_to(:controller => "cal_event_cats", :action => "destroy", :id => "1")
    end

  end
end
