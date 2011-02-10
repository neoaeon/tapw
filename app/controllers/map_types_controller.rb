class MapTypesController < ApplicationController
  # GET /map_types
  # GET /map_types.xml
  def index
    @map_types = MapType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @map_types }
    end
  end

  # GET /map_types/1
  # GET /map_types/1.xml
  def show
    @map_type = MapType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @map_type }
    end
  end

  # GET /map_types/new
  # GET /map_types/new.xml
  def new
    @map_type = MapType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @map_type }
    end
  end

  # GET /map_types/1/edit
  def edit
    @map_type = MapType.find(params[:id])
  end

  # POST /map_types
  # POST /map_types.xml
  def create
    @map_type = MapType.new(params[:map_type])

    respond_to do |format|
      if @map_type.save
        format.html { redirect_to(@map_type, :notice => 'Map type was successfully created.') }
        format.xml  { render :xml => @map_type, :status => :created, :location => @map_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @map_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /map_types/1
  # PUT /map_types/1.xml
  def update
    @map_type = MapType.find(params[:id])

    respond_to do |format|
      if @map_type.update_attributes(params[:map_type])
        format.html { redirect_to(@map_type, :notice => 'Map type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @map_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /map_types/1
  # DELETE /map_types/1.xml
  def destroy
    @map_type = MapType.find(params[:id])
    @map_type.destroy

    respond_to do |format|
      format.html { redirect_to(map_types_url) }
      format.xml  { head :ok }
    end
  end
end
