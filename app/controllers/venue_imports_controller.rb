require 'find'

class VenueImportsController < ApplicationController
  def get_vendir_arr
	id = -1
    ven_dir_arr = []
	Find.find(Venue.get_rev_dir) do |path|
	  if FileTest.directory?(path) && id >= 0 
	    ven_dir_arr <<  File.basename(path)
		Find.prune
      end # FileTest.directory?(path)
	  id += 1
	end # File.find(import_dir) do |path|
	return ven_dir_arr
  end

  def index
    # @venues = Rails
    @venue_imports = self.get_vendir_arr
    @id = 0 # index into the array
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end # respond
  end # def index
end
