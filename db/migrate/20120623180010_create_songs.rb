class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.text :lyrics, limit: nil

      t.timestamps
    end
  end
end