# == Schema Information
# Schema version: 20110209175452
#
# Table name: cal_event_cats
#
#  id          :integer         not null, primary key
#  uid         :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class CalEventCat < ActiveRecord::Base
end
