# == Schema Information
# Schema version: 20110209142059
#
# Table name: pois
#
#  id          :integer         not null, primary key
#  uid         :integer
#  name        :string(255)
#  description :text
#  poi_cat     :integer
#  lattitude   :decimal(9, 3)
#  longitude   :decimal(9, 3)
#  created_at  :datetime
#  updated_at  :datetime
#

class Poi < ActiveRecord::Base

	# TODO: This was updated from PoiCat. the non-uniques should be extracted and 
	#	handled through modules
	
	def self.to_json 
		ven_arr = Poi.all
		str_json = "[\n"
		str_add_comma = ""
		ven_arr.each do | ven_one |
			str_json << str_add_comma
			str_json << "\t{\"point_of_interest\":\n"
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
			str_json << "\",\n"

			# integer
			str_json << "\t\t\"pointOfInterestCategoryUid\": "
			str_json << ven_one.poi_cat.to_s
			str_json << ",\n"
			
			str_json << "\t\t\"latLong\": {\"latitude\": "
			str_json << ven_one.lattitude.to_s
			str_json << ", \"longitude\": "
			str_json << ven_one.longitude.to_s
			str_json << "}\n\t\t} }"

		    str_add_comma = ",\n\n"
		end
		str_json << "\n]\n"
		
		return str_json
	end
	
	# regular expessions can be tested at quickly at rubular.com
	# this can be used in all modules by just changing the variables described
	def self.create_match_array_from_json ( json_string )
		# Unique to Venue 
		rgxMatch = /\{"point_of_interest":\s*{\s*"uid":\s*(\d*)\s*,\s*"name":\s*"(.*)"\s*,\s*"description":\s*"(.*)"\s*,\s*"pointOfInterestCategoryUid":\s*(\d*)\s*,\s*"latLong":\s*\{"latitude":\s*(\d-|\d*\.\d*)\s*,\s*"longitude":\s*(\d|-\d*\.\d*)\s*\}/
		
		# this is generick
		rgxMatch.match(json_string) # returns the matched data points in an array
	end
	
	def self.flds_to_match
		# Unique to Venue 
		return 6
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
		obj_this = Poi.new
		fld_ndx = (obj_ndx * self.flds_to_match) + 1
		obj_this.uid = match_arr[fld_ndx].to_i
		obj_this.mapuid = match_arr[fld_ndx+1].to_i
		obj_this.name = match_arr[fld_ndx+2]
		obj_this.description = match_arr[fld_ndx+3]
		return obj_this
	end
	
	def self.new_from_hash_array ( hash_arr, obj_cur )
		hash_one = hash_arr[ obj_cur ]
		obj_this = Poi.new
        obj_this.uid = hash_one["point_of_interest"]["uid"]
        obj_this.name = hash_one["point_of_interest"]["name"]
        obj_this.description = hash_one["point_of_interest"]["description"]
        obj_this.poi_cat = hash_one["point_of_interest"]["pointOfInterestCategoryUid"]
        obj_this.lattitude = hash_one["point_of_interest"]["latLong"]["latitude"]
        obj_this.longitude = hash_one["point_of_interest"]["latLong"]["longitude"]
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
		return (old_obj.uid == new_obj.uid) && (old_obj.poi_cat == new_obj.poi_cat) && (old_obj.name == new_obj.name) && (old_obj.description == new_obj.description) && (old_obj.lattitude == new_obj.lattitude) && (old_obj.longitude == new_obj.longitude)

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
