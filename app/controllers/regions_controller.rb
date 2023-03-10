class RegionsController < ApplicationController
  before_action :set_country
  before_action :set_region, only: %i[destroy edit update]
    
  def index
    @regions = @country.regions
  end

  def new
    @region = @country.regions.build
  end

  def create
    @region = @country.regions.build region_params
    if @region.save
      flash[:success] = "Region created!"
      redirect_to country_regions_path
    else
      render :new
    end
  end

  def destroy
    @region.destroy
    flash[:success] = "Region deleted!"
    redirect_to country_regions_path
  end

  def edit
  end

  def update
    if @region.update region_params
      flash[:success] = "Region updated!"
      redirect_to country_regions_path
    else
      render :edit
    end
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end

  def set_country
    @country = Country.find params[:country_id]
  end

  def set_region
    @region = @country.regions.find params[:id]
  end

end