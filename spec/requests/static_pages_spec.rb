require 'spec_helper'

describe "StaticPages" do

	subject { page }
	
	describe "Home Page" do

		before{ visit '/static_pages/home' }

		
		#visit '/static_pages/home'
		it {should have_selector('title', text: "HOME")}
		it {should have_selector('h1', text: "HOME")}
	
	end
end
