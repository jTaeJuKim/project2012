require 'spec_helper'

describe Allocation do

  let(:song){ FactoryGirl.create(:song) }
  let(:setlist){ FactoryGirl.create(:setlist) }
  let(:allocation){ setlist.allocations.build(song_id: song.id, position: 1) }

  subject{ allocation }

  it{ should be_valid }

  it{ should respond_to(:setlist_id) }
  it{ should respond_to(:song_id) }
  it{ should respond_to(:position) }

  describe "When setlist id is not present" do
  	before{ allocation.setlist_id = "" }
  	it{ should_not be_valid }
  end 

  describe "When song id is not present" do
  	before{ allocation.song_id = "" }
  	it{ should_not be_valid }
  end

  describe "allocating methods" do    
    it { should respond_to(:song) }
    it { should respond_to(:setlist) }
    its(:song) { should == song }
    its(:setlist) { should == setlist }
  end

  

end
# == Schema Information
#
# Table name: allocations
#
#  id         :integer         not null, primary key
#  setlist_id :integer
#  song_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  position   :integer
#

