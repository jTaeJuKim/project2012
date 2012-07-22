class ChangeAllocationSongposition < ActiveRecord::Migration
  def up
	rename_column :allocations, :songPosition, :position
  end

  def down
  	rename_column :allocations, :position, :songPosition
  end
end
