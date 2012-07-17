require 'spec_helper'

describe Categorization do
  
  let(:song){ FactoryGirl.create(:song) }
  let(:category){ FactoryGirl.create(:category) }
  let(:categorization){ song.categorizations.build(category_id: category.id) }
  before{ @categorization = Categorization.create(song_id: 200, category_id: 200) }

  subject{ categorization }

  it{ should be_valid }

  it{ should respond_to(:category_id) }
  it{ should respond_to(:song_id) }

  describe "When song id is not present" do
  	before{ categorization.song_id = "" }
  	it{ should_not be_valid }
  end 

  describe "When category id is not present" do
  	before{ categorization.category_id = "" }
  	it{ should_not be_valid }
  end
  
  describe "categorizing methods" do    
    it { should respond_to(:song) }
    it { should respond_to(:category) }
    its(:song) { should == song }
    its(:category) { should == category }
  end

  describe "when categorization already exists" do
  	before do
  	  identical_cat =@categorization.dup
  	  identical_cat.save.should_not be_valid
  	end
  end

end
# == Schema Information
#
# Table name: categorizations
#
#  id          :integer         not null, primary key
#  song_id     :integer
#  category_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

