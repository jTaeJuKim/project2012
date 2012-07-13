class Setlist < ActiveRecord::Base
  attr_accessible :date, :morning

  validates :date, presence: true

  has_many :allocations, dependent: :destroy  #when a setlist is destroyed all associated allocations are destroyed
  has_many :songs, through: :allocations
  accepts_nested_attributes_for :allocations, :reject_if => lambda { |a| a[:song_id].blank? }

  ##methods for adding and deleting allocations? NOT NECESSARY

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
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

