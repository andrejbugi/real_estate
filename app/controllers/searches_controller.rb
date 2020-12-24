class SearchesController < ApplicationController
  def new
    @search = Search.new
    @categories = Property.distinct.pluck(:category)
    @listing_types = Property.distinct.pluck(:listing_type)
    @locations = Property.distinct.pluck(:location)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :category, :location, :min_price,
                                   :max_price, :listing_type, :bedroom, :bathroom)
  end
end
