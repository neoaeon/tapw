class PoiCatsController < ApplicationController
  # GET /poi_cats
  # GET /poi_cats.xml
  def index
    @poi_cats = PoiCat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poi_cats }
    end
  end

  # GET /poi_cats/1
  # GET /poi_cats/1.xml
  def show
    @poi_cat = PoiCat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poi_cat }
    end
  end

  # GET /poi_cats/new
  # GET /poi_cats/new.xml
  def new
    @poi_cat = PoiCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poi_cat }
    end
  end

  # GET /poi_cats/1/edit
  def edit
    @poi_cat = PoiCat.find(params[:id])
  end

  # POST /poi_cats
  # POST /poi_cats.xml
  def create
    @poi_cat = PoiCat.new(params[:poi_cat])

    respond_to do |format|
      if @poi_cat.save
        format.html { redirect_to(@poi_cat, :notice => 'Poi cat was successfully created.') }
        format.xml  { render :xml => @poi_cat, :status => :created, :location => @poi_cat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poi_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poi_cats/1
  # PUT /poi_cats/1.xml
  def update
    @poi_cat = PoiCat.find(params[:id])

    respond_to do |format|
      if @poi_cat.update_attributes(params[:poi_cat])
        format.html { redirect_to(@poi_cat, :notice => 'Poi cat was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poi_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poi_cats/1
  # DELETE /poi_cats/1.xml
  def destroy
    @poi_cat = PoiCat.find(params[:id])
    @poi_cat.destroy

    respond_to do |format|
      format.html { redirect_to(poi_cats_url) }
      format.xml  { head :ok }
    end
  end
end
