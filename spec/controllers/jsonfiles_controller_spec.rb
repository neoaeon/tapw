require 'spec_helper'

describe JsonfilesController do

  def mock_jsonfile(stubs={})
    (@mock_jsonfile ||= mock_model(Jsonfile).as_null_object).tap do |jsonfile|
      jsonfile.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all jsonfiles as @jsonfiles" do
      Jsonfile.stub(:all) { [mock_jsonfile] }
      get :index
      assigns(:jsonfiles).should eq([mock_jsonfile])
    end
  end

  describe "GET show" do
    it "assigns the requested jsonfile as @jsonfile" do
      Jsonfile.stub(:find).with("37") { mock_jsonfile }
      get :show, :id => "37"
      assigns(:jsonfile).should be(mock_jsonfile)
    end
  end

  describe "GET new" do
    it "assigns a new jsonfile as @jsonfile" do
      Jsonfile.stub(:new) { mock_jsonfile }
      get :new
      assigns(:jsonfile).should be(mock_jsonfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested jsonfile as @jsonfile" do
      Jsonfile.stub(:find).with("37") { mock_jsonfile }
      get :edit, :id => "37"
      assigns(:jsonfile).should be(mock_jsonfile)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created jsonfile as @jsonfile" do
        Jsonfile.stub(:new).with({'these' => 'params'}) { mock_jsonfile(:save => true) }
        post :create, :jsonfile => {'these' => 'params'}
        assigns(:jsonfile).should be(mock_jsonfile)
      end

      it "redirects to the created jsonfile" do
        Jsonfile.stub(:new) { mock_jsonfile(:save => true) }
        post :create, :jsonfile => {}
        response.should redirect_to(jsonfile_url(mock_jsonfile))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved jsonfile as @jsonfile" do
        Jsonfile.stub(:new).with({'these' => 'params'}) { mock_jsonfile(:save => false) }
        post :create, :jsonfile => {'these' => 'params'}
        assigns(:jsonfile).should be(mock_jsonfile)
      end

      it "re-renders the 'new' template" do
        Jsonfile.stub(:new) { mock_jsonfile(:save => false) }
        post :create, :jsonfile => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested jsonfile" do
        Jsonfile.should_receive(:find).with("37") { mock_jsonfile }
        mock_jsonfile.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :jsonfile => {'these' => 'params'}
      end

      it "assigns the requested jsonfile as @jsonfile" do
        Jsonfile.stub(:find) { mock_jsonfile(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:jsonfile).should be(mock_jsonfile)
      end

      it "redirects to the jsonfile" do
        Jsonfile.stub(:find) { mock_jsonfile(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(jsonfile_url(mock_jsonfile))
      end
    end

    describe "with invalid params" do
      it "assigns the jsonfile as @jsonfile" do
        Jsonfile.stub(:find) { mock_jsonfile(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:jsonfile).should be(mock_jsonfile)
      end

      it "re-renders the 'edit' template" do
        Jsonfile.stub(:find) { mock_jsonfile(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested jsonfile" do
      Jsonfile.should_receive(:find).with("37") { mock_jsonfile }
      mock_jsonfile.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the jsonfiles list" do
      Jsonfile.stub(:find) { mock_jsonfile }
      delete :destroy, :id => "1"
      response.should redirect_to(jsonfiles_url)
    end
  end

end
