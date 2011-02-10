# == Schema Information
# Schema version: 20110209122758
#
# Table name: jsonfiles
#
#  id          :integer         not null, primary key
#  filename    :string(255)
#  description :text
#  jsonparse   :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Jsonfile < ActiveRecord::Base
end
