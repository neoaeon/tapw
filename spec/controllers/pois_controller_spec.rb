require 'spec_helper'

describe PoisController do

  def mock_poi(stubs={})
    (@mock_poi ||= mock_model(Poi).as_null_object).tap do |poi|
      poi.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pois as @pois" do
      Poi.stub(:all) { [mock_poi] }
      get :index
      assigns(:pois).should eq([mock_poi])
    end
  end

  describe "GET show" do
    it "assigns the requested poi as @poi" do
      Poi.stub(:find).with("37") { mock_poi }
      get :show, :id => "37"
      assigns(:poi).should be(mock_poi)
    end
  end

  describe "GET new" do
    it "assigns a new poi as @poi" do
      Poi.stub(:new) { mock_poi }
      get :new
      assigns(:poi).should be(mock_poi)
    end
  end

  describe "GET edit" do
    it "assigns the requested poi as @poi" do
      Poi.stub(:find).with("37") { mock_poi }
      get :edit, :id => "37"
      assigns(:poi).should be(mock_poi)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created poi as @poi" do
        Poi.stub(:new).with({'these' => 'params'}) { mock_poi(:save => true) }
        post :create, :poi => {'these' => 'params'}
        assigns(:poi).should be(mock_poi)
      end

      it "redirects to the created poi" do
        Poi.stub(:new) { mock_poi(:save => true) }
        post :create, :poi => {}
        response.should redirect_to(poi_url(mock_poi))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved poi as @poi" do
        Poi.stub(:new).with({'these' => 'params'}) { mock_poi(:save => false) }
        post :create, :poi => {'these' => 'params'}
        assigns(:poi).should be(mock_poi)
      end

      it "re-renders the 'new' template" do
        Poi.stub(:new) { mock_poi(:save => false) }
        post :create, :poi => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested poi" do
        Poi.should_receive(:find).with("37") { mock_poi }
        mock_poi.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :poi => {'these' => 'params'}
      end

      it "assigns the requested poi as @poi" do
        Poi.stub(:find) { mock_poi(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:poi).should be(mock_poi)
      end

      it "redirects to the poi" do
        Poi.stub(:find) { mock_poi(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(poi_url(mock_poi))
      end
    end

    describe "with invalid params" do
      it "assigns the poi as @poi" do
        Poi.stub(:find) { mock_poi(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:poi).should be(mock_poi)
      end

      it "re-renders the 'edit' template" do
        Poi.stub(:find) { mock_poi(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested poi" do
      Poi.should_receive(:find).with("37") { mock_poi }
      mock_poi.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pois list" do
      Poi.stub(:find) { mock_poi }
      delete :destroy, :id => "1"
      response.should redirect_to(pois_url)
    end
  end

end
