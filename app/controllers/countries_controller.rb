class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def new
    @countries = @countries.new
  end

  def create
    @countries = Countries.new countries_params
    if @countries.save
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
    if @country.update countries_params
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country = Country.find_by id: params[:id]
    @country.destroy
    redirect_to countries_path
  end

  def show
    @country = Country.find_by id: params[:id]
  end

  private

  def countries_params
    params.require(:country).permit(:name)
  end
end