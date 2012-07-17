class Category < ActiveRecord::Base
  attr_accessible :tag

  validates :tag, presence: true, uniqueness: true

  has_many :categorizations, dependent: :destroy #if tag destroyed delete association
  has_many :songs, through: :categorizations
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

