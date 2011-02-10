require 'spec_helper'

describe MapImagesController do

  def mock_map_image(stubs={})
    (@mock_map_image ||= mock_model(MapImage).as_null_object).tap do |map_image|
      map_image.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all map_images as @map_images" do
      MapImage.stub(:all) { [mock_map_image] }
      get :index
      assigns(:map_images).should eq([mock_map_image])
    end
  end

  describe "GET show" do
    it "assigns the requested map_image as @map_image" do
      MapImage.stub(:find).with("37") { mock_map_image }
      get :show, :id => "37"
      assigns(:map_image).should be(mock_map_image)
    end
  end

  describe "GET new" do
    it "assigns a new map_image as @map_image" do
      MapImage.stub(:new) { mock_map_image }
      get :new
      assigns(:map_image).should be(mock_map_image)
    end
  end

  describe "GET edit" do
    it "assigns the requested map_image as @map_image" do
      MapImage.stub(:find).with("37") { mock_map_image }
      get :edit, :id => "37"
      assigns(:map_image).should be(mock_map_image)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created map_image as @map_image" do
        MapImage.stub(:new).with({'these' => 'params'}) { mock_map_image(:save => true) }
        post :create, :map_image => {'these' => 'params'}
        assigns(:map_image).should be(mock_map_image)
      end

      it "redirects to the created map_image" do
        MapImage.stub(:new) { mock_map_image(:save => true) }
        post :create, :map_image => {}
        response.should redirect_to(map_image_url(mock_map_image))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved map_image as @map_image" do
        MapImage.stub(:new).with({'these' => 'params'}) { mock_map_image(:save => false) }
        post :create, :map_image => {'these' => 'params'}
        assigns(:map_image).should be(mock_map_image)
      end

      it "re-renders the 'new' template" do
        MapImage.stub(:new) { mock_map_image(:save => false) }
        post :create, :map_image => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested map_image" do
        MapImage.should_receive(:find).with("37") { mock_map_image }
        mock_map_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :map_image => {'these' => 'params'}
      end

      it "assigns the requested map_image as @map_image" do
        MapImage.stub(:find) { mock_map_image(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:map_image).should be(mock_map_image)
      end

      it "redirects to the map_image" do
        MapImage.stub(:find) { mock_map_image(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(map_image_url(mock_map_image))
      end
    end

    describe "with invalid params" do
      it "assigns the map_image as @map_image" do
        MapImage.stub(:find) { mock_map_image(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:map_image).should be(mock_map_image)
      end

      it "re-renders the 'edit' template" do
        MapImage.stub(:find) { mock_map_image(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested map_image" do
      MapImage.should_receive(:find).with("37") { mock_map_image }
      mock_map_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the map_images list" do
      MapImage.stub(:find) { mock_map_image }
      delete :destroy, :id => "1"
      response.should redirect_to(map_images_url)
    end
  end

end
