class Comment < ActiveRecord::Base
  attr_accessible :content, :poster, :post_id

  belongs_to :post 

  validates :content, presence: true
  validates :post_id, presence: true
  validates :poster, presence: true

end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  poster     :string(255)
#

