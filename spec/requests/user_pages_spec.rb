require 'spec_helper'

describe "UserPages" do
  
  subject{ page }

  before do
    Role.create(description: "Vox 1")
    Role.create(description: "Vox 2")
    Role.create(description: "Vox 3")
  end

  describe "Index" do
    let(:user){FactoryGirl.create(:user)}


    before(:all){ 30.times{ FactoryGirl.create(:user) } }
    after(:all){User.delete_all}

    before do
      sign_in user 
      visit users_path
    end

    it{ should have_selector('title', text: "All users") }
    it{ should have_selector('h1', text: "BAND MEMBERS") }

    it "should list each user" do
      User.all.each do |user|
        page.should have_selector('td', text: user.name)
      end
    end

    describe "delete links" do

      it { should_not have_link('Delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('Delete', href: user_path(User.first)) }
       
        it "should be able to delete another user" do
          expect { click_link('Delete') }.to change(User, :count).by(-1)
          end
        it { should_not have_link('Delete', href: user_path(admin)) }
      end
    end
  end



  describe "Profile Page" do
  	let(:user){ FactoryGirl.create(:user) }
    before{ sign_in(user) }
  	before{ visit user_path(user) }

  	it { should have_selector('h3', text: user.name) }
  	it { should have_selector('title', text: user.name) }
  end



  describe "Edit User" do
    let(:user){FactoryGirl.create(:user)}
    before do
     sign_in user
     visit edit_user_path(user)
   end


    describe "page" do
      it{ should have_selector('h1', text: "Edit contact details") }
      it{ should have_selector('title', text: "Edit details") }
    end

    describe "with invalid info" do
      before{ click_button "Save changes" }
      it{ should have_content('error') }
    end

    describe "with valid info" do
      let(:new_name) { "New" }
      let(:new_email) { "new@new.com" }
      let(:new_surname) { "Name" }
      let(:new_phone) { "01222555555" }

      before do
        fill_in "First Name", with: new_name
        fill_in "Surname", with: new_surname
        fill_in "Email", with: new_email
        fill_in "Phone", with: new_phone
        fill_in "Password", with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end

      it{ should have_selector('div.alert.alert-success')}
      it{ should have_link('SIGN OUT', href: signout_path)}
      specify { user.reload.name.should  == new_name }
      specify { user.reload.email.should == new_email }

    end
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
