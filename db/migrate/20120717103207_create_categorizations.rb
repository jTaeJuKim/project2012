class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :song_id
      t.integer :category_id

      t.timestamps
    end

    #I'll be finding songs by category and categories by song so makes sense to have index
    add_index :categorizations, :song_id
    add_index :categorizations, :category_id
  end
end
