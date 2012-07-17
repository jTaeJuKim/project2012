require 'spec_helper'

##because roles are NOT created/manipulated directly by any user extensive tests on views not required

describe "Role pages" do
  
  subject{ page }

  before do
    @user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
    phone:"01224555555", password: "foobar", password_confirmation: "foobar")

    Role.create(description: "Vox 1")
    Role.create(description: "Vox 2")
    Role.create(description: "Vox 3")

    sign_in(@user)
  end #sign in user to access the subject pages

  describe "creating a new role" do

    before{ visit new_role_path }

    describe "with a blank text field" do
      before{ click_button "Create Role" }
      it{ should have_content('error') }
    end

    describe "with a valid role" do
      let(:sample_role){ "sample role" }
      before do
        fill_in "Describe the role below", with: sample_role
        expect{ click_button "Create Role" }.to change(User, :count).by(1)
      end

    end
  end #end creating role test

end