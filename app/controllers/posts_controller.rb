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
    @post.points = 4
    @post.submitted_by = current_user.email
    @post.save

    redirect_to action: "index"
  end
  private def post_params
    params.require(:post).permit(:question, :answer)
  end
  def verify_trivia_answer

    @useranswer = params[:triviaanswer][:answer]
    @databaseanswer = Post.find(params[:triviaanswer][:question_id]).answer
    puts @databaseanswer.inspect
    puts @useranswer.inspect

    if @useranswer ==  @databaseanswer
      redirect_to action: "index"
    else

    end
  end
end
