class Role < ActiveRecord::Base
  attr_accessible :description

  has_many :assignments
  has_many :users, through: :assignments, order:'users.name'

  validates :description, presence: true, uniqueness: true

end
# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

