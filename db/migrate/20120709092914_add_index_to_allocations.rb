class AddIndexToAllocations < ActiveRecord::Migration
  def change
  	add_index :allocations, :song_id
    add_index :allocations, :setlist_id
  end
end
