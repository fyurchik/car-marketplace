class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :approve, :reject]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def approve
    @post.update(status: :approved)
    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.replace("post-status-#{@post.id}", partial: "admin/posts/post_status", locals: { post: @post }) }
      format.html { redirect_to admin_posts_path, notice: "approved" }
    end
  end

  def reject
    @post.update(status: :rejected)
    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.replace("post-status-#{@post.id}", partial:"admin/posts/post_status", locals: { post: @post }) }
      format.html { redirect_to admin_posts_path, notice: "rejected"}
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
