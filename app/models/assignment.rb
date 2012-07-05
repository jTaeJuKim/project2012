class Assignment < ActiveRecord::Base
  attr_accessible :role_id, :user_id
  belongs_to :role
  belongs_to :user


  validates :role_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :user_id, :scope => :role_id
end
# == Schema Information
#
# Table name: assignments
#
#  id         :integer         not null, primary key
#  role_id    :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

