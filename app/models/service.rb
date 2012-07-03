class Service < ActiveRecord::Base
  attr_accessible :soundAM, :soundPM, :acoustic, :bass, 
  :date, :drums, :electric, :leader, :piano, :sax, :singers, :violin

  validates :date, presence: true

  validates :leader, presence: true
  

end
# == Schema Information
#
# Table name: services
#
#  id         :integer         not null, primary key
#  date       :date
#  leader     :string(255)
#  acoustic   :string(255)
#  electric   :string(255)
#  piano      :string(255)
#  bass       :string(255)
#  drums      :string(255)
#  sax        :string(255)
#  violin     :string(255)
#  singers    :string(255)
#  soundAM    :string(255)
#  soundPM    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

