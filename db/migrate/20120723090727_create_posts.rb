class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :content, limit: nil

      t.timestamps
    end
  end
end
