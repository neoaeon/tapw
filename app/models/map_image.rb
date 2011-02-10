# == Schema Information
# Schema version: 20110209175452
#
# Table name: map_images
#
#  id             :integer         not null, primary key
#  mapType        :string(255)
#  uid            :integer
#  name           :string(255)
#  description    :text
#  low_left_lat   :decimal(, )
#  low_left_long  :decimal(, )
#  up_left_lat    :decimal(, )
#  up_left_long   :decimal(, )
#  up_right_lat   :decimal(, )
#  up_right_long  :decimal(, )
#  low_right_lat  :decimal(, )
#  low_right_long :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#

class MapImage < ActiveRecord::Base
	# TODO: This was updated from Poi. the non-uniques should be extracted and 
	#	handled through modules
	
	def self.to_json 
		ven_arr = MapImage.all
		str_json = "[\n"
		str_add_comma = ""
		ven_arr.each do | ven_one |
			str_json << str_add_comma
			str_json << "\t{\"map\":\n"
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

			str_json << "\t\t\"latLongRegion\":\n\t\t\t{\n"

			str_json << "\t\t\"lowerLeftLatLong\": {\"latitude\": "
			str_json << ven_one.lattitude.to_s
			str_json << ", \"longitude\": "
			str_json << ven_one.longitude.to_s
			str_json << "},\n"
			
			str_json << "\t\t\"upperLeftLatLong\": {\"latitude\": "
			str_json << ven_one.lattitude.to_s
			str_json << ", \"longitude\": "
			str_json << ven_one.longitude.to_s
			str_json << "},\n"

			str_json << "\t\t\"upperRightLatLong\": {\"latitude\": "
			str_json << ven_one.lattitude.to_s
			str_json << ", \"longitude\": "
			str_json << ven_one.longitude.to_s
			str_json << "},\n"

			str_json << "\t\t\"lowerRightLatLong\": {\"latitude\": "
			str_json << ven_one.lattitude.to_s
			str_json << ", \"longitude\": "
			str_json << ven_one.longitude.to_s
			str_json << "}\n"

			str_json << "\t\t\t}\n\t\t}\n\t}" # latLongRegion,map,obj end

		    str_add_comma = ",\n\n"
		end
		str_json << "\n]\n"
		
		return str_json
	end
	
	# regular expessions can be tested at quickly at rubular.com
	# this can be used in all modules by just changing the variables described
=begin
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
		obj_this = PoiCat.new
		fld_ndx = (obj_ndx * self.flds_to_match) + 1
		obj_this.uid = match_arr[fld_ndx].to_i
		obj_this.mapuid = match_arr[fld_ndx+1].to_i
		obj_this.name = match_arr[fld_ndx+2]
		obj_this.description = match_arr[fld_ndx+3]
		return obj_this
	end
=end	
	def self.new_from_hash_array ( hash_arr, obj_cur )
		hash_one = hash_arr[ obj_cur ]
		obj_this = MapImage.new
        obj_this.name = hash_one["map"]["mapType"]
        obj_this.uid = hash_one["map"]["uid"]
        obj_this.name = hash_one["map"]["name"]
        obj_this.description = hash_one["map"]["description"]
        obj_this.lattitude = hash_one["map"]["lowerLeftLatLong"]["latitude"]
        obj_this.longitude = hash_one["map"]["lowerLeftLatLong"]["longitude"]
        obj_this.lattitude = hash_one["map"]["upperLeftLatLong"]["latitude"]
        obj_this.longitude = hash_one["map"]["upperLeftLatLong"]["longitude"]
        obj_this.lattitude = hash_one["map"]["upperRightLatLong"]["latitude"]
        obj_this.longitude = hash_one["map"]["upperRightLatLong"]["longitude"]
        obj_this.lattitude = hash_one["map"]["lowerRightLatLong"]["latitude"]
        obj_this.longitude = hash_one["map"]["lowerRightLatLong"]["longitude"]
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

	def self.obj_identical?( o1, o2 )
		# Unique to Venue 

		id_match = (o1.uid == o2.uid) && (o1.name == o2.name) && (o1.description == o2.description) && (o1.mapType == o2.mapType)
		lat_match = (o1.low_left_lat == o2.low_left_lat ) && (o1.up_left_lat == o2.up_left_lat ) && (o1.up_right_lat == o2.up_right_lat ) && (o1.low_right_lat == o2.low_right_lat ) 
		long_match = (o1.low_left_long == o2.low_left_long ) && (o1.up_left_long == o2.up_left_long ) && (o1.up_right_long == o2.up_right_long ) && (o1.low_right_long == o2.low_right_long )
		return  id_match && lat_match && long_match

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
