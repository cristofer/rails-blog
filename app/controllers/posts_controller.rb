class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :not_found]
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :tags, only: [:new, :edit]

  def index
    @posts = Post.get_all_with_tags_translations
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

  def not_found
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

  def tags
    @tags = Tag.get_all.pluck(:name).join(", ")
  end
end
