require 'spec_helper'

describe "StaticPages" do

	subject { page }
	
	describe "Home Page" do
		before{ visit '/static_pages/home' }

		it {should have_selector('title', text: "TKCC BAND APP") }
		it { should have_selector('h1', text: "HOME") }
		it { should_not have_selector('title', text: "HOME"	) }
	end

	describe "Planning" do
		before{ visit '/static_pages/planning' }

		it { should have_selector('title', text: "PLANNING") }
		it { should have_selector('h1', text: "PLANNING") }
	end


	describe "Scheduling" do
		before{ visit '/static_pages/scheduling' }

		it { should have_selector('title', text: "SCHEDULING") }
		it { should have_selector('h1', text: "SCHEDULING") }
	end

	describe "People" do
		before{ visit '/static_pages/people'}

		it{ should have_selector('title', text: "PEOPLE") }
		it{ should have_selector('h1', text: "PEOPLE") }
	end

	describe "Library" do
		before{ visit '/static_pages/library' }

		it{ should have_selector('title', text: "LIBRARY") }
		it{ should have_selector('h1', text: "LIBRARY") }
	end


end
