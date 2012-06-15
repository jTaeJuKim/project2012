require 'spec_helper'

describe "UserPages" do
  
  subject{ page }

  describe "New User Page" do
  	before{ visit new_user_path }

  	it{ should have_selector('h1', text: "Create a new user")}
  end
end
