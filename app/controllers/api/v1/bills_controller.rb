class Api::V1::BillsController < Api::V1::ApplicationController
  before_action :define_current_bill

  def create
    bill = Bill.create(bill_params)
    render json: bill
  end

  def index
    render json: Bill.all
  end

  def show
    render json: current_bill
  end

  def update
    current_bill.update(bill_params)
    render json: current_bill
  end

  def destroy
    current_bill.destroy
    render json: current_bill
  end

  def bill_params
    params.permit(:amount, :due_date, :biz_user_id, :client_user_id, :is_paid)
  end

  def define_current_bill
    if params[:id]
      @current_bill = Bill.find(params[:id])
    else
      @current_bill = Bill.new
    end
  end

  def current_bill
    @current_bill
  end
end
