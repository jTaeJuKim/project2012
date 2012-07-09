class RemoveEveningFromSetlists < ActiveRecord::Migration
  def up
  	remove_column :setlists, :evening
  end

  def down
  	add_column :setlists, :evening, :boolean
  end
end
