require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:admin) {create(:admin)}
  let(:user) {create(:user)}
  let(:post) {create(:post, user:user)}

  before do
    sign_in admin
  end

  describe "GET #show" do
    it "assigns the requested post to @post" do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "PATCH #approve" do
    it "updates the posts status to approved" do
      patch :approve, params: { id: post.id }
      post.reload
      expect(post.status).to eq("approved")
    end

    it "redirects  to the admin posts with notice" do
      patch :approve, params: { id: post.id }
      expect(response).to redirect_to(admin_posts_path)
      expect(flash[:notice]).to eq("approved")
    end
  end

  describe "PATC #reject" do
    it "updates the posts status to rejected" do
      patch :reject, params: { id: post.id }
      post.reload
      expect(post.status).to eq("rejected")
    end

    it "redirects to the admin posts and  notice" do
      patch :reject, params: { id: post.id }
      expect(response).to redirect_to(admin_posts_path)
      expect(flash[:notice]).to eq("rejected")
    end
  end
end
