class Setlist < ActiveRecord::Base
  attr_accessible :date, :evening, :morning

  validates :date, presence: true
  #validates :evening, presence: true
  #validates :morning, presence: true

  has_many :allocations, dependent: :destroy
  has_many :songs, through: :allocations
  accepts_nested_attributes_for :songs

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

