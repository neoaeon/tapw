class CreateCalEventCats < ActiveRecord::Migration
  def self.up
    create_table :cal_event_cats do |t|
      t.integer :uid
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :cal_event_cats
  end
end
