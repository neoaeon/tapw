class CreateMapTypes < ActiveRecord::Migration
  def self.up
    create_table :map_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :map_types
  end
end
