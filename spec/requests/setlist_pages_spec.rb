require 'spec_helper'

describe "Setlist Pages" do
	subject { page }


    before do
    	@user = User.create(name: "Jim", surname: "User", email:"jim@jim.com",
    	phone:"01224555555", password: "foobar", password_confirmation: "foobar")

	    Role.create(description: "Vox 1")
	    Role.create(description: "Vox 2")
	    Role.create(description: "Vox 3")
  
    	sign_in(@user)
    	@setlist = Setlist.create!(date: Date.today, morning: true)
    	@song = FactoryGirl.create(:song)

    end


	describe "setlist index" do

		before{ visit setlists_path } 


		it "should list each setlist with and add or delete link" do
			Setlist.all.each do |setlist|
				page.should have_selector('a', date: setlist.date)
				page.should have_selector('td', text: "Morning Service")
			end
		end

		describe "Delete and edit links" do

			it { should_not have_link('Delete') }
			it { should_not have_link('Add/Remove Songs') }

			describe "as an admin" do
				let(:admin) { FactoryGirl.create(:admin) }
	            before do
	            	sign_in admin
	            	visit setlists_path
	            end

	            it { should have_link('Delete', href: setlist_path(Setlist.first)) }
	            it { should have_link('Add/Remove Songs', href: edit_setlist_path(Setlist.first))}

	            it "should be able to delete a setlist" do
	            	expect { click_link('Delete') }.to change(Setlist, :count).by(-1)
	            end

			end #end admin test

		end#end delete and edit

	end #end index test



	# describe "Edit page" do
		
	# 	let(:admin) { FactoryGirl.create(:admin) }
	# 	let(:submit){ "Add Song" }
	    
	#     before do
	#        @secondSong = FactoryGirl.create(:song)
	#        sign_in admin
	#        visit edit_setlist_path(@setlist)
	#     end

	#     it{ should have_content("Edit a Setlist")}

	#     describe "adding a song" do
	#     	before do
	#     		select("#{@secondSong.title} by #{@secondSong.artist}", from: 'Songs')
	#     		click_button submit

	#     	end

	#     	it{ should have_selector('div.alert.alert-success')}

	#     	it "should create a new allocation" do
	#     		expect{click_button submit}.to change(Allocation, :count).by(1)
	#     	end

	#     end # end adding a song
	# end # end edit test



	describe "New setlist page" do

		let(:submit){ "Create Setlist" }

		before{ visit new_setlist_path}

		describe "with invalid info" do
	      before{ click_button "Create Setlist" }
	      it{ should have_content('error') }
	    end

	    describe "with valid info" do

		  before do 
		    choose('Morning')
		    expect{click_button submit}.to change(Setlist, :count).by(1)
		  end

		  it{ should have_selector('div.alert.alert-success')}
		  it{ should have_content("No songs selected yet") }

		end

	end #end new setlist test



	describe "Show setlist page" do

		before do 
			visit setlist_path(@setlist)
		end 

		describe "edit link" do

			it{ should_not have_link('EDIT')}
			
			it{ should have_selector('h3', text: "No songs selected yet")}

			describe "when the setlist isn't empty" do

				before do
					@allocation = Allocation.create(setlist_id: @setlist.id, song_id: @song.id)
					visit setlist_path(@setlist)
				end

				it{ should have_selector('td', text: @song.title)}

			end

			describe "as an admin" do
				let(:admin) { FactoryGirl.create(:admin) }

				before do
					sign_in admin
					visit setlist_path(@setlist)
				end

				it{should have_link('EDIT', href: edit_setlist_path(@setlist))}
			end

		end

	end # end show setlist test

	
end #end all tests