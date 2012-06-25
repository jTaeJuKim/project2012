class ChangeSongLyrics < ActiveRecord::Migration
  def up
  	change_table :songs do |t|
  		t.change :lyrics, :text, :limit => nil
  	end
  end

  def down
  	t.change :lyrics, :string 
  end
end
