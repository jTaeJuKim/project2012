require 'spec_helper'

describe Setlist do
  before{ @setlist = Setlist.new(date: Date.today, morning: true) }

  subject{ @setlist }

  it{ should respond_to(:date) }
  it{ should respond_to(:morning) }
  it{ should respond_to(:songs) }
  it{ should respond_to(:allocate!)}
  it{ should respond_to(:unallocate!)}

  describe "when no date is provided" do
  	before{ @setlist.date = ""}
  	it{ should_not be_valid }
  end

  describe "allocating" do
    let(:song) { FactoryGirl.create(:song) }    
    before do
      @setlist.save
      @setlist.allocate!(song)
    end

    it { should be_allocated(song) }
    its(:songs) { should include(song) }
  end

  
end
# == Schema Information
#
# Table name: setlists
#
#  id         :integer         not null, primary key
#  date       :date
#  morning    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

