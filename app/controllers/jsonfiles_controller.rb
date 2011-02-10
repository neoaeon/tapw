class JsonfilesController < ApplicationController
  # GET /jsonfiles
  # GET /jsonfiles.xml
  def index
    @jsonfiles = Jsonfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jsonfiles }
    end
  end

  # GET /jsonfiles/1
  # GET /jsonfiles/1.xml
  def show
    @jsonfile = Jsonfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jsonfile }
    end
  end

  # GET /jsonfiles/new
  # GET /jsonfiles/new.xml
  def new
    @jsonfile = Jsonfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jsonfile }
    end
  end

  # GET /jsonfiles/1/edit
  def edit
    @jsonfile = Jsonfile.find(params[:id])
  end

  # POST /jsonfiles
  # POST /jsonfiles.xml
  def create
    @jsonfile = Jsonfile.new(params[:jsonfile])

    respond_to do |format|
      if @jsonfile.save
        format.html { redirect_to(@jsonfile, :notice => 'Jsonfile was successfully created.') }
        format.xml  { render :xml => @jsonfile, :status => :created, :location => @jsonfile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jsonfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jsonfiles/1
  # PUT /jsonfiles/1.xml
  def update
    @jsonfile = Jsonfile.find(params[:id])

    respond_to do |format|
      if @jsonfile.update_attributes(params[:jsonfile])
        format.html { redirect_to(@jsonfile, :notice => 'Jsonfile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jsonfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jsonfiles/1
  # DELETE /jsonfiles/1.xml
  def destroy
    @jsonfile = Jsonfile.find(params[:id])
    @jsonfile.destroy

    respond_to do |format|
      format.html { redirect_to(jsonfiles_url) }
      format.xml  { head :ok }
    end
  end
end
