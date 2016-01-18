class ListingsController < ApplicationController
  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    else
      @listings = Listing.all
      @user = current_user
    end  
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.feature_list.add(params[:listing][:tag_list])
    @listing.save
    redirect_to '/'
  end

  def destroy
    @listing = Listing.find_by(id: params[:id])
    @listing.delete
    redirect_to '/listings'
  end

  def update
    @listing = Listing.find_by(id: params[:id])
    @listing.update(listing_params)
    redirect_to '/listings'
  end

  def edit
    @listing = Listing.find_by(id: params[:id])
  end

  def show
    @listing = Listing.find_by(id: params[:id])
  end

  def search
    @listings = Listing.search(params[:search])
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :location, :email, :user_id, {images: []})
  end
end
