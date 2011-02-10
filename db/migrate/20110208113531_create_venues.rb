class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.integer :uid
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
