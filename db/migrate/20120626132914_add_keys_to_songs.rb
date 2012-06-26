class AddKeysToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :key, :string
  end
end
