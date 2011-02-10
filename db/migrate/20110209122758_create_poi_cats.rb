class CreatePoiCats < ActiveRecord::Migration
  def self.up
    create_table :poi_cats do |t|
      t.integer :uid
      t.integer :mapuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :poi_cats
  end
end
