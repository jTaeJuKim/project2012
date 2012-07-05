require 'spec_helper'

describe Service do
  before{ @service = Service.new(date: "2012-02-22", leader: "Jo Gordon", acoustic: "Jo Gordon",
  	electric: "Gareth Donaldson", piano: "Helen Rowe", bass: "Gareth Boswell", drums: "Mike Robertson",
  	sax: "Tony Duncan", violin: "Fran Hutchison", singers: "Vox1",
  	soundAM: "Lal Dhillon", soundPM: "Dan Clews") }

  subject{ @service }

  it{ should respond_to(:date) }
  it{ should respond_to(:leader) }
  it{ should respond_to(:acoustic) }
  it{ should respond_to(:electric) }
  it{ should respond_to(:piano) }
  it{ should respond_to(:bass) }
  it{ should respond_to(:drums) }
  it{ should respond_to(:sax) }
  it{ should respond_to(:violin) }
  it{ should respond_to(:singers) }
  it{ should respond_to(:soundAM) }
  it{ should respond_to(:soundPM) }

  it{ should be_valid } 

  describe "when date is not present" do
    before{ @service.date = " " }
    it{ should_not be_valid }
  end

  describe "when leader is not present" do
    before{ @service.leader = " " }
    it{ should_not be_valid }
  end

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

