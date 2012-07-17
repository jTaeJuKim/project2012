require 'spec_helper'

describe "Authentication" do
  
  subject{ page }

  before do
    Role.create(description: "Vox 1")
    Role.create(description: "Vox 2")
    Role.create(description: "Vox 3")
  end

  describe "sign in page" do
  	before{ visit signin_path }

  	it{ should have_selector('h1', text: 'Sign in') }
  	it{ should have_selector('title', text: 'Sign in')}
  end

  describe "Sign in" do

  	before{ visit signin_path }

  	describe "with valid info" do
  		let(:user){FactoryGirl.create(:user)}
      #for code for sign in see spec/support/utilities.rb
  		before{ sign_in user }

  		it{ should have_selector('title', text: 'TKCC BAND APP') }
  		it{ should have_link('SIGN OUT', href: signout_path) }
      it{ should have_link('PROFILE', href: user_path(user)) }
      it{ should have_link('SETTINGS', href: edit_user_path(user)) }
  		it{ should_not have_link('SIGN IN', href: signin_path) }

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

  describe "authorization" do

    ##start as wrong user

    describe "as wrong user" do
      let(:user){ FactoryGirl.create(:user) }
      let(:wrong_user){ FactoryGirl.create(:user, email: "wrong@wrong.com") }
      before{ sign_in user }

      describe "visiting the Users#edit page" do
        before{ visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit details')) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before{ put user_path(wrong_user) }
        specify{ response.should redirect_to(root_path) }
      end
    end
    #end as wrong user

    describe "for non signed in users" do
      let(:user){ FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do
          it "should render the desired protected page" do
            page.should have_selector('title', text: "Edit details")
          end
        end
      end
      #end non signed in

      describe "in the users controller" do

        describe "visiting the edit page" do
          before{visit edit_user_path(user)}
          it{ should have_selector('title', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before{ put user_path(user) }
          specify{ response.should redirect_to(signin_path)}
        end

        describe "visiting the index" do
          before{ visit users_path }
          it{ should have_selector('title', text: 'Sign in')}
        end
      end
      #end users controller

      describe "as non-admin user" do
        let(:user) { FactoryGirl.create(:user) }
        let(:non_admin) { FactoryGirl.create(:user) }

        before { sign_in non_admin }

        describe "submitting a DELETE request to the Users#destroy action" do
          before { delete user_path(user) }
          specify { response.should redirect_to(root_path) }        
        end
      end

    end
  end
end
