require 'spec_helper'

describe "Setlist Pages" do

	subject { page }

    before do
      @user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")
      sign_in(@user)
    end


	describe "Edit page" do
		
	end

	
end