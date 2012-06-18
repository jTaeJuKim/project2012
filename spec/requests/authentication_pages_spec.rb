require 'spec_helper'

describe "Authentication" do
  
  subject{ page }

  describe "sign in page" do
  	before{ visit signin_path }

  	it{ should have_selector('h1', text: 'Sign in') }
  	it{ should have_selector('title', text: 'Sign in')}
  end

  describe "Sign in" do

  	before{ visit signin_path }

  	describe "with valid info" do
  		let(:user){FactoryGirl.create(:user)}
  		before do
  			fill_in "Email", with: user.email 
  			fill_in "Password", with: user.password 
  			click_button "Sign in"
  		end

  		it{ should have_selector('title', text: user.name) }
  		it{ should have_link('SIGN OUT', href: signout_path) }
  		it{ should_not have_link('Sign in', href: signin_path) }

      describe "followed by sign out" do
        before{click_link "SIGN OUT"}
        it{ should have_link('SIGN IN')}
      end
  	end



  	describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "HOME" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end # end invalid test
  end
end
