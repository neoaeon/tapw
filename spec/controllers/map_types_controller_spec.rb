require 'spec_helper'

describe MapTypesController do

  def mock_map_type(stubs={})
    (@mock_map_type ||= mock_model(MapType).as_null_object).tap do |map_type|
      map_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all map_types as @map_types" do
      MapType.stub(:all) { [mock_map_type] }
      get :index
      assigns(:map_types).should eq([mock_map_type])
    end
  end

  describe "GET show" do
    it "assigns the requested map_type as @map_type" do
      MapType.stub(:find).with("37") { mock_map_type }
      get :show, :id => "37"
      assigns(:map_type).should be(mock_map_type)
    end
  end

  describe "GET new" do
    it "assigns a new map_type as @map_type" do
      MapType.stub(:new) { mock_map_type }
      get :new
      assigns(:map_type).should be(mock_map_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested map_type as @map_type" do
      MapType.stub(:find).with("37") { mock_map_type }
      get :edit, :id => "37"
      assigns(:map_type).should be(mock_map_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created map_type as @map_type" do
        MapType.stub(:new).with({'these' => 'params'}) { mock_map_type(:save => true) }
        post :create, :map_type => {'these' => 'params'}
        assigns(:map_type).should be(mock_map_type)
      end

      it "redirects to the created map_type" do
        MapType.stub(:new) { mock_map_type(:save => true) }
        post :create, :map_type => {}
        response.should redirect_to(map_type_url(mock_map_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved map_type as @map_type" do
        MapType.stub(:new).with({'these' => 'params'}) { mock_map_type(:save => false) }
        post :create, :map_type => {'these' => 'params'}
        assigns(:map_type).should be(mock_map_type)
      end

      it "re-renders the 'new' template" do
        MapType.stub(:new) { mock_map_type(:save => false) }
        post :create, :map_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested map_type" do
        MapType.should_receive(:find).with("37") { mock_map_type }
        mock_map_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :map_type => {'these' => 'params'}
      end

      it "assigns the requested map_type as @map_type" do
        MapType.stub(:find) { mock_map_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:map_type).should be(mock_map_type)
      end

      it "redirects to the map_type" do
        MapType.stub(:find) { mock_map_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(map_type_url(mock_map_type))
      end
    end

    describe "with invalid params" do
      it "assigns the map_type as @map_type" do
        MapType.stub(:find) { mock_map_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:map_type).should be(mock_map_type)
      end

      it "re-renders the 'edit' template" do
        MapType.stub(:find) { mock_map_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested map_type" do
      MapType.should_receive(:find).with("37") { mock_map_type }
      mock_map_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the map_types list" do
      MapType.stub(:find) { mock_map_type }
      delete :destroy, :id => "1"
      response.should redirect_to(map_types_url)
    end
  end

end
