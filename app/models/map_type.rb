# == Schema Information
# Schema version: 20110209175452
#
# Table name: map_types
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class MapType < ActiveRecord::Base
end
