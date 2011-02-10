# == Schema Information
# Schema version: 20110209122758
#
# Table name: poi_cats
#
#  id          :integer         not null, primary key
#  uid         :integer
#  mapuid      :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class PoiCat < ActiveRecord::Base
	# TODO: put in validations for no spaces in venue name
	# TODO: This was updated from Venue. the non-uniques should be extracted and 
	#	handled through modules
	
	def self.to_json 
		ven_arr = PoiCat.all
		str_json = "[\n"
		str_add_comma = ""
		ven_arr.each do | ven_one |
			str_json << str_add_comma
			str_json << "\t{\"point_of_interest_category\":\n"
			str_json << "\t\t{\n"

			# integer
			str_json << "\t\t\"uid\": "
			str_json << ven_one.uid.to_s
			str_json << ",\n"
			
			# integer
			str_json << "\t\t\"mapUid\": "
			str_json << ven_one.mapuid.to_s
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
		rgxMatch = /\{\s*"point_of_interest_category":\s*\{\s*"uid":\s*(\d*),\s*"mapUid":\s*(\d*),\s*"name":\s*"(.*)",\s*"description":\s*"(.*)"\s*\}\s*\}/
		
		# this is generick
		rgxMatch.match(json_string) # returns the matched data points in an array
	end
	
	def self.flds_to_match
		# Unique to Venue 
		return 4
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
		obj_this = PoiCat.new
		fld_ndx = (obj_ndx * self.flds_to_match) + 1
		obj_this.uid = match_arr[fld_ndx].to_i
		obj_this.mapuid = match_arr[fld_ndx+1].to_i
		obj_this.name = match_arr[fld_ndx+2]
		obj_this.description = match_arr[fld_ndx+3]
		return obj_this
	end
	
	def self.new_from_hash_array ( hash_arr, obj_cur )
		hash_one = hash_arr[ obj_cur ]
		obj_this = PoiCat.new
        obj_this.uid = hash_one["point_of_interest_category"]["uid"]
        obj_this.mapuid = hash_one["point_of_interest_category"]["mapUid"]
        obj_this.name = hash_one["point_of_interest_category"]["name"]
        obj_this.description = hash_one["point_of_interest_category"]["description"]
		return obj_this
	end
	
	def self.build_arr_from_json( str_json ) 
		hash_arr = JSON.parse( str_json )
		obj_arr = [] 
		obj_count = hash_arr.size
		
		obj_cur = 0
		
		while obj_cur < obj_count do
			obj_arr << self.new_from_hash_array ( hash_arr, obj_cur )
			obj_cur = obj_cur + 1 
		end
		
		return obj_arr
	end
	
	def self.was_build_arr_from_json( str_json ) 
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
		return (old_obj.uid == new_obj.uid) && (old_obj.mapuid == new_obj.mapuid) && (old_obj.name == new_obj.name) && (old_obj.description == new_obj.description)
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
