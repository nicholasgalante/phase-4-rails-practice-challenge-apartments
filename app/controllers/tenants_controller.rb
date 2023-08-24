class TenantsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def index
    tenant = Tenant.all
    render json: tenant, status: :ok
  end

  def show
    tenant = Tenant.find(params[:id])
    render json: tenant, status: :ok
  end

  def create
    tenant = Tenant.create!(params[tenant_params])
    render json: tenant, status: :created
  end

  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    render json: {}, status: :no_content
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end

  def render_invalid_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
