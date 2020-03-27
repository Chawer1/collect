class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to posts_path, success: 'New Item Created'
    else
      render :new, danger: 'New item created failed'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to posts_path, success: 'Update successful'
    else
      render :edit, danger: 'Update failed'
    end
  end

  def find
    @items = Item.where("name LIKE ?", "%#{value_for_search}%")
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to post_path, success: 'Item delete successful'
  end

  private
  def item_params
    params.require(:item).permit(:name, :post_id, :all_tags)
  end
end
