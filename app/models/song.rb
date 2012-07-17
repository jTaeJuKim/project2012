class Song < ActiveRecord::Base
  attr_accessible :artist, :lyrics, :title, :key

  has_many :allocations, dependent: :destroy  #if song destroyed then remove from set lists 
  has_many :setlists, through: :allocations

  has_many :categorizations, dependent: :destroy #if song destroyed, delete associations
  has_many :categories, through: :categorizations

  #title, artist, and lyrics fields cannot be blank
  validates :title, presence: true
  validates :artist, presence: true
  validates :lyrics, presence: true
  validates :key, presence: true

#method for searching by title
  def self.search(search)
    if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"], order: 'title')
    else
      #if nothing is inputed then just show all songs
      find(:all, order: 'title')
    end
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

