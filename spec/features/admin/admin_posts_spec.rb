require 'rails_helper'

RSpec.feature "Admin::Posts", type: :feature do
   let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  before do
    sign_in admin
  end

  scenario "sees all posts" do
    visit admin_posts_path
    posts.each do |post|
      expect(page).to have_content(post.model)
      expect(page).to have_content(post.status.capitalize)
    end
  end

  scenario "approves the first post" do
    first_post = posts.first
    visit admin_posts_path
    first( '.approve-button').click 

    expect(page).to have_content 'approved'
    visit admin_post_path(first_post)
    expect(first_post.reload.status).to eq('approved')
  end

  scenario "rejects the first post" do
    first_post = posts.first
    
    visit admin_posts_path
    first('.reject-button').click 

    expect(page).to have_content 'rejected'
    visit admin_post_path(first_post)
    expect(first_post.reload.status).to eq('rejected')
  end
end
