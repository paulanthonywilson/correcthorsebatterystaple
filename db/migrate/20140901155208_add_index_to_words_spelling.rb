class AddIndexToWordsSpelling < ActiveRecord::Migration[4.2]
  def change
    add_index :words, :spelling, unique: true
  end
end
