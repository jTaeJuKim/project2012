require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  
  before do
  	@post = user.posts.build(subject: "Test Subject", content: "Lorem ipsum")
  	@post.save
  	@comment = @post.comments.build(content: "Lorem ipsum", poster: "#{user.name}") 
  end

  subject{ @comment }

  it { should respond_to(:content) }
  it { should respond_to(:poster) }
  it { should respond_to(:post_id) }
  its(:post) { should == @post }

  describe "when content is not present" do
    before{ @comment.content = " " }
    it{ should_not be_valid }
  end

  describe "when poster is not present" do
    before{ @comment.poster = " " }
    it{ should_not be_valid }
  end

  describe "when post id is not present" do
    before{ @comment.post_id = " " }
    it{ should_not be_valid }
  end

end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  poster     :string(255)
#

