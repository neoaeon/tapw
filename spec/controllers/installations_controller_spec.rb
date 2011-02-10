require 'spec_helper'

describe InstallationsController do

  def mock_installation(stubs={})
    (@mock_installation ||= mock_model(Installation).as_null_object).tap do |installation|
      installation.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all installations as @installations" do
      Installation.stub(:all) { [mock_installation] }
      get :index
      assigns(:installations).should eq([mock_installation])
    end
  end

  describe "GET show" do
    it "assigns the requested installation as @installation" do
      Installation.stub(:find).with("37") { mock_installation }
      get :show, :id => "37"
      assigns(:installation).should be(mock_installation)
    end
  end

  describe "GET new" do
    it "assigns a new installation as @installation" do
      Installation.stub(:new) { mock_installation }
      get :new
      assigns(:installation).should be(mock_installation)
    end
  end

  describe "GET edit" do
    it "assigns the requested installation as @installation" do
      Installation.stub(:find).with("37") { mock_installation }
      get :edit, :id => "37"
      assigns(:installation).should be(mock_installation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created installation as @installation" do
        Installation.stub(:new).with({'these' => 'params'}) { mock_installation(:save => true) }
        post :create, :installation => {'these' => 'params'}
        assigns(:installation).should be(mock_installation)
      end

      it "redirects to the created installation" do
        Installation.stub(:new) { mock_installation(:save => true) }
        post :create, :installation => {}
        response.should redirect_to(installation_url(mock_installation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved installation as @installation" do
        Installation.stub(:new).with({'these' => 'params'}) { mock_installation(:save => false) }
        post :create, :installation => {'these' => 'params'}
        assigns(:installation).should be(mock_installation)
      end

      it "re-renders the 'new' template" do
        Installation.stub(:new) { mock_installation(:save => false) }
        post :create, :installation => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested installation" do
        Installation.should_receive(:find).with("37") { mock_installation }
        mock_installation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :installation => {'these' => 'params'}
      end

      it "assigns the requested installation as @installation" do
        Installation.stub(:find) { mock_installation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:installation).should be(mock_installation)
      end

      it "redirects to the installation" do
        Installation.stub(:find) { mock_installation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(installation_url(mock_installation))
      end
    end

    describe "with invalid params" do
      it "assigns the installation as @installation" do
        Installation.stub(:find) { mock_installation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:installation).should be(mock_installation)
      end

      it "re-renders the 'edit' template" do
        Installation.stub(:find) { mock_installation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested installation" do
      Installation.should_receive(:find).with("37") { mock_installation }
      mock_installation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the installations list" do
      Installation.stub(:find) { mock_installation }
      delete :destroy, :id => "1"
      response.should redirect_to(installations_url)
    end
  end

end
