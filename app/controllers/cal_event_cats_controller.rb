class CalEventCatsController < ApplicationController
  # GET /cal_event_cats
  # GET /cal_event_cats.xml
  def index
    @cal_event_cats = CalEventCat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cal_event_cats }
    end
  end

  # GET /cal_event_cats/1
  # GET /cal_event_cats/1.xml
  def show
    @cal_event_cat = CalEventCat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cal_event_cat }
    end
  end

  # GET /cal_event_cats/new
  # GET /cal_event_cats/new.xml
  def new
    @cal_event_cat = CalEventCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cal_event_cat }
    end
  end

  # GET /cal_event_cats/1/edit
  def edit
    @cal_event_cat = CalEventCat.find(params[:id])
  end

  # POST /cal_event_cats
  # POST /cal_event_cats.xml
  def create
    @cal_event_cat = CalEventCat.new(params[:cal_event_cat])

    respond_to do |format|
      if @cal_event_cat.save
        format.html { redirect_to(@cal_event_cat, :notice => 'Cal event cat was successfully created.') }
        format.xml  { render :xml => @cal_event_cat, :status => :created, :location => @cal_event_cat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cal_event_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cal_event_cats/1
  # PUT /cal_event_cats/1.xml
  def update
    @cal_event_cat = CalEventCat.find(params[:id])

    respond_to do |format|
      if @cal_event_cat.update_attributes(params[:cal_event_cat])
        format.html { redirect_to(@cal_event_cat, :notice => 'Cal event cat was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cal_event_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cal_event_cats/1
  # DELETE /cal_event_cats/1.xml
  def destroy
    @cal_event_cat = CalEventCat.find(params[:id])
    @cal_event_cat.destroy

    respond_to do |format|
      format.html { redirect_to(cal_event_cats_url) }
      format.xml  { head :ok }
    end
  end
end
