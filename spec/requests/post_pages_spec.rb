require 'spec_helper'

describe "Post pages" do

	subject{ page }
	
	before do  
		@role = Role.create(description: "Vox 1")
		Role.create(description: "Vox 2")
		Role.create(description: "Vox 3")

		@user = User.create(name: "Jim", surname: "ze Tester", email:"jim@jim.com",
		phone:"01224555555", password: "foobar", password_confirmation: "foobar")

		Assignment.create(user_id: @user.id, role_id: @role.id)
		sign_in(@user)
    end

    describe "creating a new post" do
	    before { visit new_post_path }

	    describe "with invalid inputs" do

	      it "should not create a post" do
	        expect { click_button "Save post" }.should_not change(Post, :count)
	      end

	      describe "error messages" do
	        before { click_button "Save post" }
	        it { should have_content('error') } 
	      end
	    end

	    # describe "with valid information" do

	    #   before do
	    #   	{ fill_in 'post_content', with: "Lorem ipsum" }
	    #   end
	    #   it "should create a micropost" do
	    #     expect { click_button "Post" }.should change(Micropost, :count).by(1)
	    #   end
	    # end
    end

end
