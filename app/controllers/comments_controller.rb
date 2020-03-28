class CommentsController < ApplicationController
  def index
  end

  def create
    # puts params["format"]
    @comment = Post.find(params["format"]).comments.create(commentParams)
    puts @comment.errors.full_messages
    flash.alert = @comment.errors.full_messages
    # redirect_back fallback_location:  post_path
    redirect_back fallback_location: root_path	
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location:  root_path	
  end

  def new
  end

  private
  def commentParams
    params.permit(:content)
  end

end
