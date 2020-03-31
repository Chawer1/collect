class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @items = Item.where(post_id: [@post])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user = current_user
    if @post.save
      redirect_to posts_path, success: 'New collection created'
    else
      render :new, danger: 'New collection created failed'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Update successful'
    else
      render :edit, danger: 'Update failed'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: 'Collection delete successful'
  end



  private
  def post_params
    params.require(:post).permit(:title, :summary, :topic, :image)
  end
end
