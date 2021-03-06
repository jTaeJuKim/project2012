require 'spec_helper'

describe Song do
  #lyrics set to a*256 to ensure 255 character limit DOES NOT apply 
  before{ @song = Song.new(title: "Example Song", artist: "Example Artist", lyrics: "a"*256,
    key: "G")} 

  subject{ @song }

  it{ should respond_to(:title) }
  it{ should respond_to(:artist) }
  it{ should respond_to(:lyrics) }
  it{ should respond_to(:key) }
  it{ should respond_to(:allocations)}
  it{ should respond_to(:setlists)}
  it{ should respond_to(:categorizations) }
  it{ should respond_to(:categories)}

  it{should be_valid}

  describe "when title is blank" do
  	before{ @song.title = "" }
  	it{ should_not be_valid }
  end

  describe "when artist is blank" do
  	before{ @song.artist = "" }
  	it{ should_not be_valid }
  end

  describe "when lyrics are blank" do
  	before{ @song.lyrics = ""}
  	it{ should_not be_valid }
  end

  describe "when key is blank" do
    before{ @song.key = "" }
    it{ should_not be_valid}
  end
  
end
# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  lyrics     :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  key        :string(255)
#

