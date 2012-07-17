require 'spec_helper'

describe Category do
  before{ @category = Category.new(tag: "Example Category") }

  subject{ @category }

  it{ should respond_to(:tag) }


  describe "when tag description isn't present" do
  	before{ @category.tag = "" }
  	it{ should_not be_valid }
  end

  describe "when category already exists" do
  	before do
  	  identical_category =@category.dup
  	  identical_category.save
  	end

  	it{ should_not be_valid }
  end
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  tag        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

