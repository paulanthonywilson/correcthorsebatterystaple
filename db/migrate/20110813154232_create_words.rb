class CreateWords < ActiveRecord::Migration[4.2]
  def self.up
    create_table :words do |t|
      t.string :spelling

      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end
