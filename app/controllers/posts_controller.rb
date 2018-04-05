class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new

  end

  def show
     @post = Post.find(params[:id])
     @answerstate = State.new
     @answerstate.answercount = 0


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

    @post = Post.find(params[:post][:question_id])
    @useranswer = params[:post][:answer]
    @databaseanswer = Post.find(params[:post][:question_id]).answer
    @currentuser = User.find_by_email(current_user.email)

    @answerstate = State.new
    @answerstate.answercount = 0


    if @useranswer.downcase == @databaseanswer.downcase

      @currentuser.score = @currentuser.score + 4
      @currentuser.save
      @answerstate.answerflag = "true"
      @answerstate.answercount += 1

    else
      if @currentuser.score != 0
          @currentuser.score = @currentuser.score - 1
          @currentuser.save
      end
      @answerstate.answerflag = "false"
      @answerstate.answercount += 1

    end

    render 'show'

  end

end

class State
  attr_accessor :answerflag, :answercount
end