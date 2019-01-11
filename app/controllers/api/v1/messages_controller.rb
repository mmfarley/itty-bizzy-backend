class Api::V1::MessagesController < Api::V1::ApplicationController
  before_action :define_current_message

  def create
    message = Message.create(message_params)
    render json: message
  end

  def index
    render json: Message.all
  end

  def show
    render json: current_message
  end

  def update
    current_message.update(message_params)
    render json: current_message
  end

  def destroy
    current_message.destroy
    render json: current_message
  end

  def message_params
    params.permit(:content, :sender_user_id, :receiver_user_id)
  end

  def define_current_message
    if params[:id]
      @current_message = Message.find(params[:id])
    else
      @current_message = Message.new
    end
  end

  def current_message
    @current_message
  end
end
