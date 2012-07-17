class Categorizations < ActiveRecord::Base
  attr_accessible :category_id, :song_id

  validates :category_id, presence: true
  validates :song_id, presence: true

  validates_uniqueness_of :category_id, :scope => :song_id
end
