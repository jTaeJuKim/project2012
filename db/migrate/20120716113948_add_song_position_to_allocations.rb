class AddSongPositionToAllocations < ActiveRecord::Migration
  def change
    add_column :allocations, :songPosition, :integer
    add_index :allocations, :songPosition
  end
end
