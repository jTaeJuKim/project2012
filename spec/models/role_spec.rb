require 'spec_helper' 

describe Role do
  before{ @role = Role.new(description: "Example Role") }

  subject{ @role }

  it{ should respond_to(:description) }

  describe "when description isn't present" do
  	before{ @role.description = "" }
  	it{ should_not be_valid }
  end

  describe "when role already exists" do
  	before do
  	  identical_role =@role.dup
  	  identical_role.save
  	end

  	it{ should_not be_valid }
  end

end
# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

