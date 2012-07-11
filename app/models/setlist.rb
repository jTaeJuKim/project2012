class Setlist < ActiveRecord::Base
  attr_accessible :date, :evening, :morning

  validates :date, presence: true
  #validates :evening, presence: true
  #validates :morning, presence: true

  has_many :allocations, dependent: :destroy  #when a setlist is destroyed all associated allocations are destroyed
  has_many :songs, through: :allocations
  accepts_nested_attributes_for :allocations

  ##methods for adding and deleting allocations?

  def allocated?(song)
  	allocations.find_by_song_id(song.id)
  end

  def allocate!(song)
  	allocations.create!(song_id: song.id)
  end

  def unallocate!(song)
  	allocations.find_by_song_id(song.id).destroy
  end

end
# == Schema Information
#
# Table name: setlists
#
#  id         :integer         not null, primary key
#  date       :date
#  morning    :boolean
#  evening    :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
