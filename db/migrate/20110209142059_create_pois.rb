class CreatePois < ActiveRecord::Migration
  def self.up
    create_table :pois do |t|
      t.integer :uid
      t.string :name
      t.text :description
      t.integer :poi_cat
      t.decimal :lattitude, :precision => 9, :scale => 3
      t.decimal :longitude, :precision => 9, :scale => 3

      t.timestamps
    end
  end

  def self.down
    drop_table :pois
  end
end
