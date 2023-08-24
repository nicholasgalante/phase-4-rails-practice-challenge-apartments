class LeasesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  def destroy
  end

  private

  def lease_params
    params.permit(:rent, :apartment_id, :tenant_id)
  end

  def render_invalid_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
