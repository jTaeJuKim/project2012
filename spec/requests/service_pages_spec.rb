require 'spec_helper'

describe "Service pages" do

  subject { page }

  before do  # sign in user so that facilities can be accessed

    @role = Role.create(description: "Vox 1")
    Role.create(description: "Vox 2")
    Role.create(description: "Vox 3")


  
    @user = User.create(name: "Jim", surname: "ze Tester", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")

    Assignment.create(user_id: @user.id, role_id: @role.id)
    sign_in(@user)
  end

  let(:service){ FactoryGirl.create(:service)}

  describe "It should list each service" do

  	before{ visit root_path }

    Service.all.each do |service|
        page.should have_selector('td', date: service.date)
        page.should have_selector('td', text: service.leader)
        page.should have_selector('td', text: service.acoustic)
        page.should have_selector('td', text: service.electric)
        page.should have_selector('td', text: service.piano)
        page.should have_selector('td', text: service.bass)
        page.should have_selector('td', text: service.drums)
        page.should have_selector('td', text: service.sax)
        page.should have_selector('td', text: service.violin)
        page.should have_selector('td', text: service.singers)
        page.should have_selector('td', text: service.soundAM)
        page.should have_selector('td', text: service.soundPM)
    end

    it "should have a list of vocal teams" do
      page.should have_selector('li', text: "Vox 1: ")
      page.should have_selector('li', text: "Vox 2: ")
      page.should have_selector('li', text: "Vox 3: ")
    end

    it "should list the singers on each team" do
      page.should have_selector('li', text: "#{@user.name} #{@user.surname} |")
    end


  end # end checking rota test

  describe "When a role in the rota is unassigned it shouldn't be blank" do
  	before{ service.sax = "" }
  	Service.all.each do |service|
  		page.should have_selector('td', text: "N/A")
  	end
  end

end
