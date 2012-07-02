class RenameSoundColumn < ActiveRecord::Migration
  def self.up
  	rename_column :services, :AMsound, :soundAM
  	rename_column :services, :PMsound, :soundPM
  end

  def self.down
  	rename_column :services, :soundAM, :AMsound
  	rename_column :services, :soundPM, :PMsound
  end
  
end
