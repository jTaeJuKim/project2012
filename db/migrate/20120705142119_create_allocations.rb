class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.integer :setlist_id
      t.integer :song_id

      t.timestamps
    end
  end
end
