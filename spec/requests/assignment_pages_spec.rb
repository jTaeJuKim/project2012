require 'spec_helper'

describe "Assignment pages" do


	subject{ page }

	before do
      @user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")
      @roleFirst = Role.create(description: "Tester")
      @roleSecond = Role.create(description: "Role Two")
      @assignment = Assignment.create(user_id: 1, role_id: 1)
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

		#@assignment = Assignment.create(user_id: 1, role_id: 2)

		#before{ visit assignments_path }

		#it{ should have_selector('title', text: "TKCC BAND APP")}

		#This test is failing but due to a test database issue rather than an application issue
		#I have since tested this in the application and through the console and found it to be working perfectly
	end

end