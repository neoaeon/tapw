class CreateMapImages < ActiveRecord::Migration
  def self.up
    create_table :map_images do |t|
      t.string :mapType
      t.integer :uid
      t.string :name
      t.text :description
      t.decimal :low_left_lat,   ß:precision => 9, :scale => 3
      t.decimal :low_left_long,  :precision => 9, :scale => 3
      t.decimal :up_left_lat,    :precision => 9, :scale => 3
      t.decimal :up_left_long,   :precision => 9, :scale => 3
      t.decimal :up_right_lat,   :precision => 9, :scale => 3
      t.decimal :up_right_long,  :precision => 9, :scale => 3
      t.decimal :low_right_lat,  :precision => 9, :scale => 3
      t.decimal :low_right_long, :precision => 9, :scale => 3

      t.timestamps
    end
  end

  def self.down
    drop_table :map_images
  end
end
