class Allocation < ActiveRecord::Base
  attr_accessible :setlist_id, :song_id, :position

  belongs_to :song
  belongs_to :setlist 

  validates :setlist_id, presence: true
  validates :song_id, presence: true

end
# == Schema Information
#
# Table name: allocations
#
#  id         :integer         not null, primary key
#  setlist_id :integer
#  song_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  position   :integer
#

