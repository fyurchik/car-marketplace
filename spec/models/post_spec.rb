require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      post = Post.new
      expect(post).to respond_to(:user)
    end
  end
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'is not valid without an image' do
      post = build(:post, image: nil)
      expect(post).to_not be_valid
    end
  end

  describe 'enums' do
    it 'defines a status enum' do
      expect(Post.statuses.keys).to match_array(['pending', 'approved', 'rejected'])
    end
  end
end
