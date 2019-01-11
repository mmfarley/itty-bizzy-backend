class Api::V1::BusinessesController < Api::V1::ApplicationController

  before_action :define_current_business

  def create
    business = Business.create(business_params)
    render json: business
  end

  def index
    render json: Business.all
  end

  def show
    render json: current_business
  end

  def update
    current_business.update(business_params)
    render json: current_business
  end

  def destroy
    current_business.destroy
    render json: current_business
  end

  def business_params()
    params.permit(:user_id, :description, :hourly_rate, :service_type)
  end

  def define_current_business
    if params[:id]
      @current_business = Business.find(params[:id])
    else
      @current_business = Business.new
    end
  end

  def current_business
    @current_business
  end

end
