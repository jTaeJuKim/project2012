require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(subject: "Test Subject", content: "Lorem ipsum") }

  subject{ @post }

  it { should respond_to(:subject) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id)}
  its(:user) { should == user }

  describe "when subject is not present" do
    before{ @post.subject = " " }
    it{ should_not be_valid }
  end

  describe "when content is not present" do
    before{ @post.content = " " }
    it{ should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

