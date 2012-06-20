require 'spec_helper'

describe "UserPages" do
  
  subject{ page }

  describe "Profile Page" do
  	let(:user){ FactoryGirl.create(:user) }
  	before{ visit user_path(user) }

  	it { should have_selector('h1', text: user.name) }
  	it { should have_selector('title', text: user.name) }
  end

  describe "New User Page" do
  	before{ visit new_user_path }

  	it{ should have_selector('h1', text: "Sign Up") }
  end

  describe "Sign up new user" do
  	before{ visit new_user_path }
  	let(:submit){"Create account"}

  	describe "with invalid info" do
  		it "shouldn't create a user" do
  			expect{ click_button submit }.not_to change(User, :count)
  		end
  	end

  	describe "with valid info" do
  		before do
  			fill_in "First Name", with: "Justin"
        fill_in "Surname", with: "Kim"
  			fill_in "Email", with: "tjk.abdn@gmail.com"
        fill_in "Phone", with: "01224555555"
  			fill_in "Password", with: "foobar"
  			fill_in "Confirmation", with: "foobar"
        
  		end

  		it "should create a user" do
  			expect{ click_button submit }.to change(User, :count).by(1)
        end
    end
end
end
