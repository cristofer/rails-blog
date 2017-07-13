class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show, :destroy]

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
      flash[:notice] = I18n.t('forms.messages.success')
      redirect_to post_path(@post)
    else
      flash.now[:alert] = I18n.t('forms.messages.error')
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = I18n.t('forms.messages.success')
      redirect_to post_path(@post)
    else
      flash.now[:alert] = I18n.t('forms.messages.error')
      render :edit
    end
  end

  def destroy
    @post.destroy

    flash[:notice] = I18n.t('forms.messages.success')
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_list)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t('extras.post_not_found')
    redirect_to posts_path
  end
end
