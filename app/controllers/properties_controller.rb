class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find_by[:params_id]
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :category, :bedroom, :bathroom,
                                     :location, :price, :listing_type, :interior)
  end
end
