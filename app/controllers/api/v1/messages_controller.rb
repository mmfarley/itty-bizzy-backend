class Api::V1::MessagesController < Api::V1::ApplicationController
  before_action :define_current_message

  def user_messages
    messages = Message.where(user_id: params[:user_id]).order(:created_at)
    received_messages = Message.where(messaged_user_id: params[:user_id]).order(:created_at)

    messaged_user_ids = messages.map{|message| message.messaged_user_id}
    received_messages.each{|message| messaged_user_ids.push(message.user_id)}

    messaged_users = []
    conversations = []
    messaged_user_ids.uniq.each do |id|
      messaged_users.push(User.find(id))
      conversation = []
      messages.each do |message|
        if message.messaged_user_id == id
          conversation.push(message)
        end
      end
      received_messages.each do |message|
        if message.user_id == id
          conversation.push(message)
        end
      end
      conversation.sort_by!{|message| message.sent_at}
      conversations.push(conversation)
    end

    render json: {conversations: conversations, messaged_users: messaged_users}
  end

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
    params.permit(:content, :user_id, :messaged_user_id)
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
