class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_property, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @properties = Property.search(params[:search])
  end

  def show; end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user

    if @property.save
      redirect_to properties_path
      flash[:success] = 'Property added'
    else
      render :new
      flash[:danger] = 'Cannot add this property'
    end
  end

  def edit; end

  def update
    if @property.update
      redirect_to properties_path
      flash[:success] = 'Successfully updated property'
    else
      render :edit
      flash[:danger] = 'Cannot edit this property'
    end
  end

  def destroy
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
                                     :location, :price, :listing_type, :interior,
                                     images: [])
  end

  def find_property
    @property = Property.find(params[:id])
  end

  def correct_user
    unless current_user == @property.user
      redirect_to root_path
      flash[:danger] = 'Wrond User'
    end
  end
end
