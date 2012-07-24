require 'spec_helper'

describe "Post pages" do

	subject{ page }
	
	before do  
		@role = Role.create(description: "Vox 1")
		Role.create(description: "Vox 2")
		Role.create(description: "Vox 3")


		@user = User.create(name: "Jim", surname: "ze Tester", email:"jim@jim.com",
		phone:"01224555555", password: "foobar", password_confirmation: "foobar")
		@post = @user.posts.build(subject: "Test Subject", content: "Lorem Ipsum")
		@post.save!


		Assignment.create(user_id: @user.id, role_id: @role.id)
		sign_in(@user)
    end

    describe "creating a new post" do
	    before { visit new_post_path }

	    describe "with invalid inputs" do

	      it "should not create a post" do
	        expect { click_button "Save post" }.should_not change(Post, :count)
	      end

	      describe "error messages" do
	        before { click_button "Save post" }
	        it { should have_content('error') } 
	      end
	    end

	    describe "with valid information" do

	      before do
	      	 fill_in "Subject", with: "Test Subject"
	      	 fill_in "Post", with: "Lorem ipsum" 
	      end
	      it "should create a post" do
	        expect { click_button "Save post" }.should change(Post, :count).by(1)
	      end
	    end
    end #end create new post test

    describe "post index" do
    	before do
    		# @post = @user.posts.build(subject: "Test Subject", content: "Lorem Ipsum").save!
    		visit posts_path
    	end

    	it "should list each post" do
	        Post.all.each do |post|
		        page.should have_link(post.subject, href: post_path(post))
		        page.should have_selector('td', text: "#{post.user.name} #{post.user.surname}")
                page.should have_selector('td', text: post.created_at.to_s)
                page.should have_selector('td', text: post.comments.count.to_s)
	        end
        end

    	it { should_not have_link('DELETE') }

    	describe "visiting as an admin user" do
    		let(:admin) { FactoryGirl.create(:admin) }
    		before do
    			sign_in admin
    			visit posts_path
    		end

    		it { should have_link('DELETE') }
    		it "should be able to delete a post" do
	            expect { click_link('DELETE') }.to change(Post, :count).by(-1)
            end
    	end
    end

    describe "reading a post" do

    	before do
    		@comment = @post.comments.build(poster: "tester", content: "test comment")
    		@comment.save!
    		visit post_path(@post)
    	end
  
    	it{ should have_selector('pre', text: @post.content)}
		it{ should have_selector('p', text: @post.comments.first.content)}
		it{ should have_selector('h5', 
			text: "Posted by: #{@post.comments.first.poster} at #{@post.comments.first.created_at}")}
		it{ should_not have_link("Delete comment") }

		describe "posting a comment" do
			let(:submit){"Post"}

			describe "with no content" do
				before do
					click_button "Post"
					expect{ click_button submit}.not_to change(Comment, :count)
			    end
			end

			before do
				fill_in "WRITE COMMENT", with: "TEST COMMENT"
				click_button "Post"
				expect{ click_button submit}.to change(Comment, :count).by(1)
			end
			
		end

		describe "as an admin" do
			let(:admin) { FactoryGirl.create(:admin) }
    		before do
    			sign_in admin
    			visit post_path(@post)
    		end
    		it { should have_link('Delete comment') }
    		it "should be able to delete a post" do
	            expect { click_link('Delete comment') }.to change(Comment, :count).by(-1)
            end

		end

    
    end

    describe "editing a post" do

    	describe "with invalid info" do
    		before do
    			visit edit_post_path(@post)
    			fill_in "Subject", with: ""
    		    click_button "Save post"
    		end

    		it{should have_content('error')}

    	end

    	before do
    		visit edit_post_path(@post)
			fill_in "Subject", with: "DIFFERENT POST"
			fill_in "Post", with: "TESTING WITH A DIFFERENT POST"
			click_button "Save post"
		end

		it{ should have_selector('div.alert.alert-success') }
    end


end
