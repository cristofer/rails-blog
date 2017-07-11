class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def index
    @posts = Post.get_all
  end

  def show
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your post was created successfully"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your post was not created"
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "Your post was updated successfully"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your post was not updated"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Your post was deleted successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post was not deleted"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The post you were looking for could not be found.'
    redirect_to posts_path
  end
end
