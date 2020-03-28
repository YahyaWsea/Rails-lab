class PostsController < ApplicationController
  def create
    @post = Post.create(postParams)
    if @post.id
      redirect_to :posts#index
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show

    @post = Post.find(params[:id])
    @comments = Post.find(params[:id]).comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update(postParams)
      redirect_to :posts#index
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts#index
  end

  def new
    @post = Post.new
  end

  # controller private methods
  private
  def postParams
    params.require(:post).permit(:title , :content)
  end
end
