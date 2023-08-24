class ApartmentsController < ApplicationController
  rescue_from AciveRecord::RecordInvalid, with: :render_invalid_response

  def index
    apartments = Apartment.all
    render json: apartments, status: :ok
  end

  def show
    apartment = Apartment.find(params[:id])
    render json: apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def destroy
   apartment = Apartment.find(params[:id])
   apartment.destroy
   render json: {}, status: :no_content
  end

  private

  def apartment_params
    params.permit(:number)
  end

  def render_invalid_response(exception)
   render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
