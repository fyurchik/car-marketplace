require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user)}

  
  before do
    sign_in user
  end

  describe 'GET #index' do
    let!(:post) { create(:post, user: user) }

    it 'assigns @posts' do
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #filter' do
    let!(:approved_post) { create(:post, user: user, status: 'approved') }
    let!(:pending_post) { create(:post, user: user, status: 'pending') }

    context 'when status is specified' do
      it 'filters posts by status' do
        get :filter, params: { status: 'pending' }
        expect(assigns(:posts)).to match_array([pending_post])
      end
    end

    context 'when status is not specified' do
      it 'returns all posts' do
        get :filter
        expect(assigns(:posts)).to match_array([approved_post, pending_post])
      end
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post, user: user) }

    it 'renders the show template' do
      get :show, params: {id: post.id }
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'assigns a new post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET #edit' do
    let(:post) { create(:post, user: user)}

    it 'assigns the requested post' do
      get :edit, params: { id:post.id}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'POST #create' do
    it 'creates a new post' do
      expect {
        post :create, params: {post: attributes_for(:post) }
      }.to change(Post,:count).by(1)
    end

    it 'redirects to the new post' do
      post :create, params: { post: attributes_for(:post) }
      expect(response).to redirect_to(Post.last)
    end
  end

  describe 'PATCH #update' do
    let!(:post) { create(:post, user: user) }

    it 'updates the post' do
      patch :update, params: {id: post.id, post: { name:'Updated' } }
      post.reload
      expect(post.name).to eq('Updated')
    end

    it 'redirects to the updated post' do
      patch :update, params: {  id:post.id,post: { name:'Updated'}   }
      expect(response).to redirect_to(post)
    end
  end

end
