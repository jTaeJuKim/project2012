class AddIndexToRolesDescription < ActiveRecord::Migration
  def change
  	add_index :roles, :description, unique: true
  end

  #Why do we need this migration?
  #Alice signs up for the sample app, with address alice@wonderland.com.
  #Alice accidentally clicks on “Submit” twice, sending two requests in quick succession.
  #The following sequence occurs: request 1 creates a user in memory that passes validation, request 2 does the same, request 1’s user gets saved, request 2’s user gets saved.
  #Result: two user records with the exact same email address, despite the uniqueness validation.
end
