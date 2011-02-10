class CreateInstallations < ActiveRecord::Migration
  def self.up
    create_table :installations do |t|
      t.string :name
      t.text :description
      t.references :venue
      t.integer :release
      t.references :migration

      t.timestamps
    end
  end

  def self.down
    drop_table :installations
  end
end
