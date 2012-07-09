class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.date :date
      t.boolean :morning
      t.boolean :evening

      t.timestamps
    end
  end
end
