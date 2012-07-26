class Song < ActiveRecord::Base
  attr_accessible :artist, :lyrics, :title, :key, :categorizations_attibutes, :categories_attributes

  has_many :allocations #dependent: :destroy  #if song destroyed then don't remove from set lists for CCLI 
  has_many :setlists, through: :allocations

  has_many :categorizations, dependent: :destroy #if song destroyed, delete associations
  has_many :categories, through: :categorizations

  #title, artist, and lyrics fields cannot be blank
  validates :title, presence: true
  validates :artist, presence: true
  validates :lyrics, presence: true
  validates :key, presence: true

  accepts_nested_attributes_for :categorizations, :reject_if => lambda { |a| a[:category_id].blank? }

  def self.search(search)
    res=includes(:categories).order('title')
    res=res.where('title LIKE :search OR categories.tag 
      LIKE :search 
      OR lyrics LIKE :search OR artist LIKE :search',:search=>"%#{search}%") if search
    res
  end

  def self.search_by_category(search)
    res=joins(:categories).order('title')
    res=res.where('categories.tag LIKE ?',"%#{search}%")
    #use in instead of like?
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

