class AddPosterToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :poster, :string 
  end
end
