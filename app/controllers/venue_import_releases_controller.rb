class VenueImportReleasesController < VenueImportsController
  def get_revdir_arr ( venue_dir )
	# revision directories take the form rev_###### ignore any other filenames
	rev_dir_rgx = /\Arev_(\d{6})\z/i

	# we has to skip our own directory, so start at -1
	id_test = -1
	rev_root_dir = Venue.get_rev_dir << venue_dir << "/"
	revdir_arr = []

	Find.find(rev_root_dir) do |path|
	  if FileTest.directory?(path) && id_test >= 0
	    if rev_dir_rgx.match(File.basename(path))
			revdir_arr <<  File.basename(path)
		end
		Find.prune
      end # FileTest.directory?(path)
	  id_test += 1
	end # File.find(import_dir) do |path|
	return revdir_arr
  end


  def index
	@idx = params[:vendir].to_i
	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@idx]
	@venue_import_releases = self.get_revdir_arr @venue_import
    # @venues = Rails

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end # show
  
  def json_out file_name, json_string
	f = File.new(file_name, File::CREAT | File::TRUNC | File::RDWR, 0644)
	f << json_string
	f.close
  end

  def publish venue_new_dir
	self.json_out "#{venue_new_dir}/VenueList.json", Venue.to_json
	self.json_out "#{venue_new_dir}/PointOfInterestCategoryList.json", PoiCat.to_json
	self.json_out "#{venue_new_dir}/PointOfInterestList.json", Poi.to_json

  end
  
  def pubto
	@rev_num = 0
	@idx = params[:vendir].to_i
	@rev_match = params[:revndx].to_i
	
	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@idx]
	@venue_import_releases = self.get_revdir_arr @venue_import
	
	@venue_imports = self.get_vendir_arr
	@venue_import_releases = self.get_revdir_arr @venue_import

	@venue_new_dir = Venue.get_rev_dir << @venue_import << "/" << @venue_import_releases[@rev_match]
	self.publish  @venue_new_dir
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end
  
  def new
	@rev_num = 0
	@idx = params[:vendir].to_i
	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@idx]
	@venue_import_releases = self.get_revdir_arr @venue_import
	rev_dir_rgx = /\Arev_(\d{6})\z/i
	@venue_import_releases.each do | venue_import |
	  rev_match = rev_dir_rgx.match( venue_import )
	  if @rev_num < rev_match[1].to_i
	    @rev_num = rev_match[1].to_i
	  end
	end
	@rev_num += 1
	
    @venue_new_dir = Venue.create_revision_dir @venue_import, @rev_num
	@venue_import_releases = self.get_revdir_arr @venue_import
	self.publish @venue_new_dir
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end
end
