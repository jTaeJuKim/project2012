class Category < ActiveRecord::Base
  attr_accessible :tag

  validates :tag, presence: true

  has_many :categorizations, dependent: :destroy #if tag destroyed delete association
  has_many :songs, through: :categorizations
end
