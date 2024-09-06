require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      before do
         user = create(:user)
        sign_in user
        get :index
      end

    it "redirects to the posts path" do
      expect(response).to redirect_to(posts_path)
    end
  end

    context "when user is logged out" do
      before do
        get :index
      end

      it "redirects to the new user session path" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
