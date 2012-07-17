require 'spec_helper'

describe "Category pages" do

	subject{page}
	let(:user){FactoryGirl.create(:admin)}
	

	before do

	    Role.create(description: "Vox 1")
	    Role.create(description: "Vox 2")
	    Role.create(description: "Vox 3")
	    sign_in(user)
    end #sign in user to access the pages

    describe "creating a new category" do

	    before{ visit new_category_path }

	    describe "with a blank text field" do
	      before{ click_button "Create Tag" }
	      it{ should have_content('error') }
	    end

	    describe "with a valid category" do
	      let(:sample_category){ "sample category" }
	      before do
	        fill_in "Tag Description", with: sample_category
	        expect{ click_button "Create Tag" }.to change(Category, :count).by(1)
	      end
	    end

    end #end creating category test

    describe "deleting a category" do

    	before do
	    	@category = Category.create(tag: "TEST TAG")
	    	visit categories_path
	    	it{ should have_link("DELETE TAG") }
	    	expect{click_button "DELETE TAG" }.to change(Category, :count).by(-1)
    	end 


    end


end
