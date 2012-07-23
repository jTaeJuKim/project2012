class Post < ActiveRecord::Base
  attr_accessible :content, :subject

  validates :content, presence: true
  validates :subject, presence: true
  validates :user_id, presence: true

  #every post belongs to one user
  belongs_to :user

  #orders with newest posts first
  default_scope order: 'posts.created_at DESC'
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

