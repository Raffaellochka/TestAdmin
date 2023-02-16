class CitiesController < ApplicationController
  before_action :set_country
  before_action :set_region
  before_action :set_city, only: %i[destroy edit update]

  def index
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @cities = @region.cities
  end

  def new
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.build
  end

  def create
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.build city_params
    if @city.save
      flash[:success] = "City created!"
      redirect_to country_region_cities_path
    else
      render :new
    end
  end

  def destroy
    @city.destroy
    flash[:success] = "City deleted!"
    redirect_to country_region_cities_path
  end

  def edit

  end

  def update
    if @city.update city_params
      flash[:success] = "City updated!"
      redirect_to country_region_cities_path
    else
      render :edit
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end

  def set_country
    @country = Country.find params[:country_id]
  end

  def set_region
    @region = @country.regions.find params[:region_id]
  end

  def set_city
    @city = @region.cities.find params[:id]
  end

end