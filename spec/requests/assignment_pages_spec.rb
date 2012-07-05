require 'spec_helper'

describe "Assignment pages" do


	subject{ page }

	before do
      @user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")
      @roleFirst = Role.create(description: "Tester")
      @roleSecond = Role.create(description: "Role Two")
      sign_in(@user)
    end #sign in user to access the subject pages

    @assignment = Assignment.create(user_id: 1, role_id: 1)

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

		#before do
			#@assignment = Assignment.create(user_id: 1, role_id: 1)
			#visit assignments_path 
		#end

		#it{ should have_selector('th', text: "Band Member") }
	end

end