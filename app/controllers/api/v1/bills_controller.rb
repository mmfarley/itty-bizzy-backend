class Api::V1::BillsController < Api::V1::ApplicationController
  before_action :define_current_bill

  def user_bills
    sent_bills = Bill.where(user_id: params[:user_id], is_paid: false)
    received_bills = Bill.where(billed_user_id: params[:user_id], is_paid: false)
    sent_bills.each do |bill|
      bill.sender = bill.user.business.name
      bill.recipient = bill.billed_user.name
    end
    received_bills.each do |bill|
      bill.sender = bill.user.business.name
      bill.recipient = bill.billed_user.name
    end
    render json: {sent_bills: sent_bills, received_bills: received_bills}
  end

  def create
    bill = Bill.create(bill_params)
    render json: bill
  end

  def update
    current_bill.update(bill_params)
    render json: current_bill
  end

  def bill_params
    params.permit(:amount, :due_date, :user_id, :billed_user_id, :is_paid, :sender, :recipient)
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
