class MapImagesController < ApplicationController
  # GET /map_images
  # GET /map_images.xml
  def index
    @map_images = MapImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @map_images }
    end
  end

  # GET /map_images/1
  # GET /map_images/1.xml
  def show
    @map_image = MapImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @map_image }
    end
  end

  # GET /map_images/new
  # GET /map_images/new.xml
  def new
    @map_image = MapImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @map_image }
    end
  end

  # GET /map_images/1/edit
  def edit
    @map_image = MapImage.find(params[:id])
  end

  # POST /map_images
  # POST /map_images.xml
  def create
    @map_image = MapImage.new(params[:map_image])

    respond_to do |format|
      if @map_image.save
        format.html { redirect_to(@map_image, :notice => 'Map image was successfully created.') }
        format.xml  { render :xml => @map_image, :status => :created, :location => @map_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @map_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /map_images/1
  # PUT /map_images/1.xml
  def update
    @map_image = MapImage.find(params[:id])

    respond_to do |format|
      if @map_image.update_attributes(params[:map_image])
        format.html { redirect_to(@map_image, :notice => 'Map image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @map_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /map_images/1
  # DELETE /map_images/1.xml
  def destroy
    @map_image = MapImage.find(params[:id])
    @map_image.destroy

    respond_to do |format|
      format.html { redirect_to(map_images_url) }
      format.xml  { head :ok }
    end
  end
end
