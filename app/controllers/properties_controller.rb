class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to properties_path
      flash[:success] = 'Property added'
    else
      render :new
      flash[:danger] = 'Cannot add this property'
    end
  end

  def edit
    @property = Porperty.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update
      redirect_to properties_path
      flash[:success] = 'Successfully updated property'
    else
      render :edit
      flash[:danger] = 'Cannot edit this property'
    end
  end

  def destroy
    @property = Property.find(params[:id])

    if @property.delete
      redirect_to properties_path
      flash[:success] = 'Successfully deleted this property'
    else
      redirect_to @property
      flash[:danger] = 'Cannot delete this property'
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :category, :bedroom, :bathroom,
                                     :location, :price, :listing_type, :interior, images: [])
  end
end
