class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new

  end

  def show
     @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to action: "index"
  end
  private def post_params
    params.require(:post).permit(:question, :answer, :points)
  end
end
