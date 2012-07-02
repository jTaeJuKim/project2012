class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.date :date
      t.string :leader
      t.string :acoustic
      t.string :electric
      t.string :piano
      t.string :bass
      t.string :drums
      t.string :sax
      t.string :violin
      t.string :singers
      t.string :AMsound
      t.string :PMsound

      t.timestamps
    end
  end
end
