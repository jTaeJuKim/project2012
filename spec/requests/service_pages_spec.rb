require 'spec_helper'

describe "Service pages" do

  subject { page }

  before do  # sign in user so that facilities can be accessed
    @user = User.create(name: "Jim", surname: "ze Tester", email:"jim@jim.com",
      phone:"01224555555", password: "foobar", password_confirmation: "foobar")
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


  end # end checking rota test

  describe "When a role in the rota is unassigned it shouldn't be blank" do
  	before{ service.sax = "" }
  	Service.all.each do |service|
  		page.should have_selector('td', text: "N/A")
  	end
  end

end
