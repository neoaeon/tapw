# == Schema Information
# Schema version: 20110208104327
#
# Table name: installations
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  venue_id     :integer
#  release      :integer
#  migration_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Installation < ActiveRecord::Base
  belongs_to :venue
  belongs_to :migration
end
