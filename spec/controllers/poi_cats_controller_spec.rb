require 'spec_helper'

describe PoiCatsController do

  def mock_poi_cat(stubs={})
    (@mock_poi_cat ||= mock_model(PoiCat).as_null_object).tap do |poi_cat|
      poi_cat.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all poi_cats as @poi_cats" do
      PoiCat.stub(:all) { [mock_poi_cat] }
      get :index
      assigns(:poi_cats).should eq([mock_poi_cat])
    end
  end

  describe "GET show" do
    it "assigns the requested poi_cat as @poi_cat" do
      PoiCat.stub(:find).with("37") { mock_poi_cat }
      get :show, :id => "37"
      assigns(:poi_cat).should be(mock_poi_cat)
    end
  end

  describe "GET new" do
    it "assigns a new poi_cat as @poi_cat" do
      PoiCat.stub(:new) { mock_poi_cat }
      get :new
      assigns(:poi_cat).should be(mock_poi_cat)
    end
  end

  describe "GET edit" do
    it "assigns the requested poi_cat as @poi_cat" do
      PoiCat.stub(:find).with("37") { mock_poi_cat }
      get :edit, :id => "37"
      assigns(:poi_cat).should be(mock_poi_cat)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created poi_cat as @poi_cat" do
        PoiCat.stub(:new).with({'these' => 'params'}) { mock_poi_cat(:save => true) }
        post :create, :poi_cat => {'these' => 'params'}
        assigns(:poi_cat).should be(mock_poi_cat)
      end

      it "redirects to the created poi_cat" do
        PoiCat.stub(:new) { mock_poi_cat(:save => true) }
        post :create, :poi_cat => {}
        response.should redirect_to(poi_cat_url(mock_poi_cat))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved poi_cat as @poi_cat" do
        PoiCat.stub(:new).with({'these' => 'params'}) { mock_poi_cat(:save => false) }
        post :create, :poi_cat => {'these' => 'params'}
        assigns(:poi_cat).should be(mock_poi_cat)
      end

      it "re-renders the 'new' template" do
        PoiCat.stub(:new) { mock_poi_cat(:save => false) }
        post :create, :poi_cat => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested poi_cat" do
        PoiCat.should_receive(:find).with("37") { mock_poi_cat }
        mock_poi_cat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :poi_cat => {'these' => 'params'}
      end

      it "assigns the requested poi_cat as @poi_cat" do
        PoiCat.stub(:find) { mock_poi_cat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:poi_cat).should be(mock_poi_cat)
      end

      it "redirects to the poi_cat" do
        PoiCat.stub(:find) { mock_poi_cat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(poi_cat_url(mock_poi_cat))
      end
    end

    describe "with invalid params" do
      it "assigns the poi_cat as @poi_cat" do
        PoiCat.stub(:find) { mock_poi_cat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:poi_cat).should be(mock_poi_cat)
      end

      it "re-renders the 'edit' template" do
        PoiCat.stub(:find) { mock_poi_cat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested poi_cat" do
      PoiCat.should_receive(:find).with("37") { mock_poi_cat }
      mock_poi_cat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the poi_cats list" do
      PoiCat.stub(:find) { mock_poi_cat }
      delete :destroy, :id => "1"
      response.should redirect_to(poi_cats_url)
    end
  end

end
