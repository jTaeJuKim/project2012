class ChangeDataTypeForSongLyrics < ActiveRecord::Migration
  def up
  	change_table :songs do |t|
  		t.change :lyrics, :text
  	end
  end

  def down
  	change_table :song do |t|
  		t.change :lyrics, :string
  	end
  end
end
