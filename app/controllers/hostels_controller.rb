class HostelsController < ApplicationController

  def index
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostels = @city.hostels
  end

  def new
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostel = @city.hostels.build
  end

  def create
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostel = @city.hostels.build hostel_params
    if @hostel.save
      flash[:success] = "Hostel created!"
      redirect_to country_region_city_hostels_path
    else
      render :new
    end
  end

  def destroy
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    hostel = @city.hostels.find params[:id]
    hostel.destroy
    flash[:success] = "Hostel deleted!"
    redirect_to country_region_city_hostels_path
  end

  def edit
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostel = @city.hostels.find params[:id]
  end

  def update
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostel = @city.hostels.find params[:id]
    if @hostel.update hostel_params
      flash[:success] = "Hostel updated!"
      redirect_to country_region_city_hostels_path
    else
      render :edit
    end
  end

  def show
    @country = Country.find params[:country_id]
    @region = @country.regions.find params[:region_id]
    @city = @region.cities.find params[:city_id]
    @hostel = @city.hostels.find params[:id]
  end

  private

  def hostel_params
    params.require(:hostel).permit(:name, :description, :price, :region_name, :city_name)
  end
end