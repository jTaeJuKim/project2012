class Setlist < ActiveRecord::Base
  attr_accessible :date, :morning

  validates :date, presence: true
  validates_inclusion_of :morning, in: [true, false]

  has_many :allocations, dependent: :destroy  #when a setlist is destroyed all associated allocations are destroyed
  has_many :songs, through: :allocations
  accepts_nested_attributes_for :allocations, :reject_if => lambda { |a| a[:song_id].blank? }


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

