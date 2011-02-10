require 'spec_helper'

describe CalEventCatsController do

  def mock_cal_event_cat(stubs={})
    (@mock_cal_event_cat ||= mock_model(CalEventCat).as_null_object).tap do |cal_event_cat|
      cal_event_cat.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all cal_event_cats as @cal_event_cats" do
      CalEventCat.stub(:all) { [mock_cal_event_cat] }
      get :index
      assigns(:cal_event_cats).should eq([mock_cal_event_cat])
    end
  end

  describe "GET show" do
    it "assigns the requested cal_event_cat as @cal_event_cat" do
      CalEventCat.stub(:find).with("37") { mock_cal_event_cat }
      get :show, :id => "37"
      assigns(:cal_event_cat).should be(mock_cal_event_cat)
    end
  end

  describe "GET new" do
    it "assigns a new cal_event_cat as @cal_event_cat" do
      CalEventCat.stub(:new) { mock_cal_event_cat }
      get :new
      assigns(:cal_event_cat).should be(mock_cal_event_cat)
    end
  end

  describe "GET edit" do
    it "assigns the requested cal_event_cat as @cal_event_cat" do
      CalEventCat.stub(:find).with("37") { mock_cal_event_cat }
      get :edit, :id => "37"
      assigns(:cal_event_cat).should be(mock_cal_event_cat)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cal_event_cat as @cal_event_cat" do
        CalEventCat.stub(:new).with({'these' => 'params'}) { mock_cal_event_cat(:save => true) }
        post :create, :cal_event_cat => {'these' => 'params'}
        assigns(:cal_event_cat).should be(mock_cal_event_cat)
      end

      it "redirects to the created cal_event_cat" do
        CalEventCat.stub(:new) { mock_cal_event_cat(:save => true) }
        post :create, :cal_event_cat => {}
        response.should redirect_to(cal_event_cat_url(mock_cal_event_cat))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cal_event_cat as @cal_event_cat" do
        CalEventCat.stub(:new).with({'these' => 'params'}) { mock_cal_event_cat(:save => false) }
        post :create, :cal_event_cat => {'these' => 'params'}
        assigns(:cal_event_cat).should be(mock_cal_event_cat)
      end

      it "re-renders the 'new' template" do
        CalEventCat.stub(:new) { mock_cal_event_cat(:save => false) }
        post :create, :cal_event_cat => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cal_event_cat" do
        CalEventCat.should_receive(:find).with("37") { mock_cal_event_cat }
        mock_cal_event_cat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cal_event_cat => {'these' => 'params'}
      end

      it "assigns the requested cal_event_cat as @cal_event_cat" do
        CalEventCat.stub(:find) { mock_cal_event_cat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cal_event_cat).should be(mock_cal_event_cat)
      end

      it "redirects to the cal_event_cat" do
        CalEventCat.stub(:find) { mock_cal_event_cat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cal_event_cat_url(mock_cal_event_cat))
      end
    end

    describe "with invalid params" do
      it "assigns the cal_event_cat as @cal_event_cat" do
        CalEventCat.stub(:find) { mock_cal_event_cat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cal_event_cat).should be(mock_cal_event_cat)
      end

      it "re-renders the 'edit' template" do
        CalEventCat.stub(:find) { mock_cal_event_cat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cal_event_cat" do
      CalEventCat.should_receive(:find).with("37") { mock_cal_event_cat }
      mock_cal_event_cat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cal_event_cats list" do
      CalEventCat.stub(:find) { mock_cal_event_cat }
      delete :destroy, :id => "1"
      response.should redirect_to(cal_event_cats_url)
    end
  end

end
