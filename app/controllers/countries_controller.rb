class CountriesController < ApplicationController
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
    @country = Country.find_by id: params[:id]
  end

  def update
    @country = Country.find_by id: params[:id]
    if @country.update country_params
      flash[:success] = "Country updated!"
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country = Country.find_by id: params[:id]
    @country.destroy
    flash[:success] = "Country deleted!"
    redirect_to countries_path
  end

  def show
    @country = Country.find_by id: params[:id]
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end