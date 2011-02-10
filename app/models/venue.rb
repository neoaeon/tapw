# == Schema Information
# Schema version: 20110209122758
#
# Table name: venues
#
#  id          :integer         not null, primary key
#  uid         :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# == Schema Information
# Schema version: 20110208113531
#
# Table name: venues
#
#  id          :integer         not null, primary key
#  uid         :integer		    unique key in existing files
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
require 'rubygems'
require 'json'


class Venue < ActiveRecord::Base
	# TODO: put in validations for no spaces in venue name
	
    def self.create_revision_dir venue_name, rev_num 
        rev_dir_name = sprintf("rev_%06d", rev_num)

	    venue_dir = Venue.get_rev_dir << venue_name << "/" << rev_dir_name
	    FileUtils.mkdir venue_dir
		return venue_dir
		
	  # rescue
	    #errors don't matter here, means the file is there already
	  #	return venue_dir
    end
	
	
    def self.get_rev_dir
	  # "#{Rails.root}/public/system/venues/"
	  "#{Rails.root}/app/views/static_pages/venues/"
    end
	
	# Unique to each module
	def self.was_to_json 
		ven_arr = Venue.all
		str_json = ""
		arr_hash = []
		ven_arr.each do | ven_one |
			hash_tmp = { "venue" => { "uid" => ven_one.uid, "name" => ven_one.name, "description" => ven_one.description } }
			arr_hash << hash_tmp
		end
		str_json = arr_hash.to_json
		
		return str_json
	end
	
	def self.to_json 
		ven_arr = Venue.all
		str_json = "[\n"
		str_add_comma = ""
		ven_arr.each do | ven_one |
			str_json << str_add_comma
			str_json << "\t{\"venue\":\n"
			str_json << "\t\t{\n"

			# integer
			str_json << "\t\t\"uid\": "
			str_json << ven_one.uid.to_s
			str_json << ",\n"
			
			# string
			str_json << "\t\t\"name\": \""
			str_json << ven_one.name
			str_json << "\",\n"

            # string and last item (no ',' in last line)
			str_json << "\t\t\"description\": \""
			str_json << ven_one.description
			str_json << "\"\n"
			
			str_json << "\t\t}\n"
			str_json << "\t}"
		    str_add_comma = ",\n"
		end
		str_json << "\n]\n"
		
		return str_json
	end
	
	# regular expessions can be tested at quickly at rubular.com
	# this can be used in all modules by just changing the variables described
	def self.create_match_array_from_json ( json_string )
		# Unique to Venue 
		rgxMatch = /\{\s*"venue":\s*\{\s*"uid":\s*(\d*),\s*"name":\s*"(.*)",\s*"description":\s*"(.*)"\s*\}\s*\}/
		
		# this is generick
		rgxMatch.match(json_string) # returns the matched data points in an array
	end
	
	def self.flds_to_match
		# Unique to Venue 
		return 3
	end
	
	def self.match_obj_count ( match_arr )
		if match_arr.size > self.flds_to_match
			return (match_arr.size-1)/self.flds_to_match
		else
			return 0
		end
	end
	
	def self.new_from_match_array ( match_arr, obj_ndx )
		# Unique to venue all of this functino
		obj_this = Venue.new
		fld_ndx = (obj_ndx * self.flds_to_match) + 1
		obj_this.uid = match_arr[fld_ndx].to_i
		obj_this.name = match_arr[fld_ndx+1]
		obj_this.description = match_arr[fld_ndx+2]
		return obj_this
	end
	
	def self.build_arr_from_json( str_json ) 
		match_arr = self.create_match_array_from_json ( str_json )
		obj_arr = [] 
		obj_count = self.match_obj_count match_arr
		obj_cur = 0
		
		while obj_cur < obj_count do
			obj_arr << self.new_from_match_array ( match_arr, obj_cur )
			obj_cur = obj_cur + 1 
		end
		
		return obj_arr
	end

	def self.obj_identical?( old_obj, new_obj )
		# Unique to Venue 
		return (old_obj.uid == new_obj.uid) && (old_obj.name == new_obj.name) && (old_obj.description == new_obj.description)
	end
	
	def self.array_identical?( old_arr, new_arr )
		arr_match = false
		new_arr.each do | new_obj |
			arr_match = false
			old_arr.each do | old_obj |
				if self.obj_identical?( new_obj, old_obj )
					arr_match = true
					break
				end
			end
			if arr_match == false
				return false
			end 
		end
		# test is run in each direction, to insure full coverage
		# makes it slightly slower, but these are small arrays, and rare operations
		arr_match = false
		old_arr.each do | old_obj |
			arr_match = false
			new_arr.each do | new_obj |
				if self.obj_identical?( new_obj, old_obj )
					arr_match = true
					break
				end
			end
			if arr_match == false
				return false
			end 
		end
		return arr_match
	end

end
