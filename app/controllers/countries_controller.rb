class CountriesController < ApplicationController
  before_action :set_country, only: %i[show destroy edit update]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new country_params
    if @country.save
      flash[:success] = "Country created!"
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update country_params
      flash[:success] = "Country updated!"
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    flash[:success] = "Country deleted!"
    redirect_to countries_path
  end

  def show
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

  def set_country
    @country = Country.find params[:id]
  end
end