class CollectionsController < ApplicationController
  def index
    @collection = Collection.all
  end

  def show
    @collectionss = Collection.find(params[:id])

  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to @collection, success: 'New Collection Created'
    else
      render :new, danger: 'New collection created failed'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(collection_params)
      redirect_to @collection, success: 'Update successful'
    else
      render :edit, danger: 'Update failed'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collections_path, success: 'Collection delete successful'
  end

  private
  def collection_params
    params.require(:collection).permit(:name)
  end
end
