class Song < ActiveRecord::Base
  attr_accessible :artist, :lyrics, :title, :key

  #title, artist, and lyrics fields cannot be blank
  validates :title, presence: true
  validates :artist, presence: true
  validates :lyrics, presence: true
  validates :key, presence: true
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

