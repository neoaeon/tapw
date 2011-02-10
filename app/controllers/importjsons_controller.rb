class ImportjsonsController < VenueImportReleasesController
  def read_json_file_to_string ( json_file_name )
	jstring = ""
	IO.foreach(json_file_name) do |aFile| 
		jstring <<= aFile << " "
	end
	return jstring
  end

  def venue
	@vend = params[:vendir].to_i
	@revn = params[:revndx].to_i

	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@vend]
	@venue_import_releases = self.get_revdir_arr @venue_import
	@reldir = @venue_import_releases[@revn] 
	
	json_upload_dir = Venue.get_rev_dir << @venue_import << "/" << @reldir << "/"

	#poi_controller
	@poi_list_file = "#{json_upload_dir}PointOfInterestList.json"
	@str_poi_list = self.read_json_file_to_string ( @poi_list_file )
	@poisImport = Poi.build_arr_from_json( @str_poi_list )
	@poisData = Poi.all
	@poisSame = Poi.array_identical?(@poisImport, @poisData ) 

	#poi_cats_controller
	@poi_cat_list_file = "#{json_upload_dir}PointOfInterestCategoryList.json"
	@str_poi_cat_list = self.read_json_file_to_string ( @poi_cat_list_file )
	@poi_catsImport = PoiCat.build_arr_from_json( @str_poi_cat_list )
	@poi_catsData = PoiCat.all
	@poi_catsSame = PoiCat.array_identical?(@poi_catsImport, @poi_catsData ) 

	#venues
	@venue_list_file = "#{json_upload_dir}VenueList.json"
	@str_venue_list = self.read_json_file_to_string ( @venue_list_file )
	@venuesDelete = Venue.all
	@venuesDelete.each do | ven_del |
		ven_del.destroy
	end
	@venuesDelete = []
	@venuesImport = Venue.build_arr_from_json( @str_venue_list )
	@venuesImport.each do | ven_imp |
		ven_imp.save
	end
	@venuesData = Venue.all
	@venuesSame = Venue.array_identical?(@venuesImport, @venuesData ) 
    @poiSame = @poisSame && @poi_catsSame

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end


  def poi_cat
  	@vend = params[:vendir].to_i
	@revn = params[:revndx].to_i

	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@vend]
	@venue_import_releases = self.get_revdir_arr @venue_import
	@reldir = @venue_import_releases[@revn] 
	
	json_upload_dir = Venue.get_rev_dir << @venue_import << "/" << @reldir << "/"

	#venues
	@venue_list_file = "#{json_upload_dir}VenueList.json"
	@str_venue_list = self.read_json_file_to_string ( @venue_list_file )
	@venuesImport = Venue.build_arr_from_json( @str_venue_list )
	@venuesData = Venue.all
	@venuesSame = Venue.array_identical?(@venuesImport, @venuesData ) 

	#poi_cats_controller
	@poi_cat_list_file = "#{json_upload_dir}PointOfInterestCategoryList.json"
	@str_poi_cat_list = self.read_json_file_to_string ( @poi_cat_list_file )
	@poi_catsImport = PoiCat.build_arr_from_json( @str_poi_cat_list )
	@poi_catsDelete = PoiCat.all
	@poi_catsDelete.each do | poi_cat_del |
		poi_cat_del.destroy
	end
	@poi_catsDelete = []

	@poi_catsImport.each do | poi_cat_imp |
		poi_cat_imp.save
	end
	
	@poi_catsData = PoiCat.all
	@poi_catsSame = PoiCat.array_identical?(@poi_catsImport, @poi_catsData ) 


	#pois_controller ^^^^^^^
	@poi_list_file = "#{json_upload_dir}PointOfInterestList.json"
	@str_poi_list = self.read_json_file_to_string ( @poi_list_file )
	@poisImport = Poi.build_arr_from_json( @str_poi_list )
	@poisDelete = Poi.all
	@poisDelete.each do | poi_del |
		poi_del.destroy
	end
	@poisDelete = []

	@poisImport.each do | poi_imp |
		poi_imp.save
	end
	
	@poisData = Poi.all
	@poisSame = Poi.array_identical?(@poisImport, @poisData ) 
    @poiSame = @poisSame && @poi_catsSame
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end


  def index
	@vend = params[:vendir].to_i
	@revn = params[:revndx].to_i

	@venue_imports = self.get_vendir_arr
	@venue_import =  @venue_imports[@vend]
	@venue_import_releases = self.get_revdir_arr @venue_import
	@reldir = @venue_import_releases[@revn] 
	
	json_upload_dir = Venue.get_rev_dir << @venue_import << "/" << @reldir << "/"

	#venues
	@venue_list_file = "#{json_upload_dir}VenueList.json"
	@str_venue_list = self.read_json_file_to_string ( @venue_list_file )
	@venuesImport = Venue.build_arr_from_json( @str_venue_list )
	@venuesData = Venue.all
	@venuesSame = Venue.array_identical?(@venuesImport, @venuesData ) 

	#poi_cats_controller
	@poi_cat_list_file = "#{json_upload_dir}PointOfInterestCategoryList.json"
	@str_poi_cat_list = self.read_json_file_to_string ( @poi_cat_list_file )
	@poi_catsImport = PoiCat.build_arr_from_json( @str_poi_cat_list )
	@poi_catsData = PoiCat.all
	@poi_catsSame = PoiCat.array_identical?(@poi_catsImport, @poi_catsData ) 

	#pois_controller
	@poi_list_file = "#{json_upload_dir}PointOfInterestList.json"
	@str_poi_list = self.read_json_file_to_string ( @poi_list_file )
	@poisImport = Poi.build_arr_from_json( @str_poi_list )
	@poisData = Poi.all
	@poisSame = Poi.array_identical?(@poisImport, @poisData ) 

    @poiSame = @poisSame && @poi_catsSame

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end # index
  
end
