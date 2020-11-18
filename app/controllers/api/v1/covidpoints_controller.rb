class Api::V1::CovidpointsController < ApplicationController
  def index
    render json: Covidpoint.all
  end

  def create
    covidpoint = Covidpoint.create(covidpoint_params)
    render json: covidpoint
  end

  def destroy
    Covidpoint.destroy(params[:id])
  end

  def update
    covidpoint = Covidpoint.find(params[:id])
    covidpoint.update_attribute(:confirmed, params[:confirmed])
    render json: covidpoint
  end

  private

  def covidpoint_params
    params.require(:covidpoint).permit(:id, :location, :country_code, :latitude, :longitude, :confirmed, :dead)
  end
end
