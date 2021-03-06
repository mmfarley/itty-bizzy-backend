class Api::V1::MessagesController < Api::V1::ApplicationController
  before_action :define_current_message

  def user_messages
    messages = Message.where(user_id: params[:user_id]).order(:created_at)
    received_messages = Message.where(messaged_user_id: params[:user_id]).order(:created_at)

    messaged_user_ids = messages.map{|message| message.messaged_user_id}
    received_messages.each{|message| messaged_user_ids.push(message.user_id)}

    conversations = []
    messaged_user_ids.uniq.each do |id|
      messaged_user = User.find(id)
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
      conversation.sort_by!{|message| message.created_at}
      conversations.push({:messaged_user => messaged_user, :conversation => conversation})
    end

    render json: {conversations: conversations}
  end

  def messaged_users
    id = params[:user_id]
    received_messages = Message.where(messaged_user_id: id)

    messaged_user_ids = received_messages.map{|message| message.user_id}
    user_biz = Business.where(user_id: id)
    user_biz_id = user_biz.map{|biz| biz.id}
    biz_clients = Client.where(business_id: user_biz_id)
    biz_clients_ids = biz_clients.map{|client| client.client_user_id}

    filtered_user_ids = (messaged_user_ids.uniq - biz_clients_ids.uniq)|(biz_clients_ids.uniq - messaged_user_ids.uniq)

    messaged_users = []
    filtered_user_ids.each do |id|
      messaged_user = User.find(id)
      messaged_users.push(messaged_user)
    end
    render json: messaged_users
  end

  def create
    message = Message.create(message_params)

    messages = Message.where(user_id: params[:user_id]).order(:created_at)
    received_messages = Message.where(messaged_user_id: params[:user_id]).order(:created_at)

    messaged_user_ids = messages.map{|message| message.messaged_user_id}
    received_messages.each{|message| messaged_user_ids.push(message.user_id)}

    conversations = []
    messaged_user_ids.uniq.each do |id|
      messaged_user = User.find(id)
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
      conversation.sort_by!{|message| message.created_at}
      conversations.push({:messaged_user => messaged_user, :conversation => conversation})
    end

    render json: {conversations: conversations}
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
