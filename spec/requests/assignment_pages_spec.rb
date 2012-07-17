require 'spec_helper'

describe "Assignment pages" do


	subject{ page }

	before do
      @user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")
      @roleFirst = Role.create(description: "Tester")
      @roleSecond = Role.create(description: "Role Two")
      @assignment = Assignment.create(user_id: @user.id, role_id: @roleSecond.id)
      #NOTE when you create a user in the test database the id is not automatically 1

	  Role.create(description: "Vox 1")
	  Role.create(description: "Vox 2")
	  Role.create(description: "Vox 3")


      sign_in(@user)
    end #sign in user to access the subject pages


	describe "Creating a new assignment" do
		before{ visit new_assignment_path }
		let(:submit){ "Assign role" }

		describe "with a blank form" do
			it "should not create an assignment" do
				expect{click_button submit}.not_to change(Assignment, :count)
			end
		end

		describe "with a valid form" do
			before do
				select("Jim User", from: 'Band Member')
				select("Tester", from: 'Role')
			end
			it "should create a new assignment" do
				expect{click_button submit}.to change(Assignment, :count).by(1)
			end
		end
	end #end new assignment tests

	describe "Deleting an assignment" do

		before{ visit assignments_path }

		it{ should have_link("Remove role") }

	end #end delete tests

end