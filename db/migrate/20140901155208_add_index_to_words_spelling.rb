class AddIndexToWordsSpelling < ActiveRecord::Migration
  def change
    add_index :words, :spelling, unique: true
  end
end
