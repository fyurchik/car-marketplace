class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: %i[show edit update destroy]

  def index
   @posts = current_user&.posts
  end

  def filter
    if params[:status].present?
      @posts = current_user.posts.where(status: params[:status])
    else
      @posts = current_user.posts.all
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('posts', partial: 'admin/posts/posts', locals: { posts: @posts }) }
      format.html { render :index }
    end
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:brand, :model, :body_type, :mileage, :color, :price, :fuel, :year, :engine_capacity, :phone_number, :name, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end