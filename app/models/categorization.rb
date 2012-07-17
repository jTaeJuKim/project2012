class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :song_id

  belongs_to :category
  belongs_to :song

  validates :song_id, presence: true
  validates :category_id, presence: true
  validates_uniqueness_of :song_id, :scope => :category_id
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

