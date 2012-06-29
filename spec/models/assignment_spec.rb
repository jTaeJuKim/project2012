require 'spec_helper'

describe Assignment do

	before{ @assignment = Assignment.new(role_id: 1, user_id: 1) }

  	subject{ @assignment }

  	it{ should respond_to(:role_id) }
  	it{ should respond_to(:user_id) }

  	describe "When role id not present" do
  		before{ @assignment.role_id = "" }
  		it{ should_not be_valid }
  	end

  	describe "When user id is not present" do
  		before{ @assignment.user_id = "" }
  		it{ should_not be_valid }
  	end
end
# == Schema Information
#
# Table name: assignments
#
#  id         :integer         not null, primary key
#  role_id    :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

