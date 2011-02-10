class CreateJsonfiles < ActiveRecord::Migration
  def self.up
    create_table :jsonfiles do |t|
      t.string :filename
      t.text :description
      t.text :jsonparse

      t.timestamps
    end
  end

  def self.down
    drop_table :jsonfiles
  end
end
