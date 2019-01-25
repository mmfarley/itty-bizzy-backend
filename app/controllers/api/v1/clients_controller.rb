class Api::V1::ClientsController < Api::V1::ApplicationController

  before_action :define_current_client

  def client_users
    clients = Client.where(business_id: params[:business_id])
    client_users = clients.map{|client| [User.find(client.client_user_id), client.id]}
    render json: client_users
  end

  def client_businesses
    clients = Client.where(client_user_id: params[:client_user_id])
    client_businesses = clients.map{|client| Business.find(client.business_id)}
    render json: client_businesses
  end

  def create
    client = Client.create(business_id: params[:business_id], client_user_id: params[:client_user_id])

    clients = Client.where(business_id: params[:business_id])
    client_users = clients.map{|client| [User.find(client.client_user_id), client.id]}

    id = params[:user_id]
    received_messages = Message.where(messaged_user_id: id)

    messaged_user_ids = received_messages.map{|message| message.user_id}
    biz_clients_ids = clients.map{|client| client.client_user_id}

    filtered_user_ids = (messaged_user_ids.uniq - biz_clients_ids.uniq)|(biz_clients_ids.uniq - messaged_user_ids.uniq)

    messaged_users = []
    filtered_user_ids.each do |id|
      messaged_user = User.find(id)
      messaged_users.push(messaged_user)
    end

    render json: {client_users: client_users, messaged_users: messaged_users}
  end

  def index
    render json: Client.all
  end

  def show
    render json: current_client
  end

  def update
    current_client.update(client_params)
    render json: current_client
  end

  def destroy
    current_client.destroy

    clients = Client.where(business_id: params[:business_id])
    client_users = clients.map{|client| [User.find(client.client_user_id), client.id]}

    id = params[:user_id]
    received_messages = Message.where(messaged_user_id: id)

    messaged_user_ids = received_messages.map{|message| message.user_id}
    biz_clients_ids = clients.map{|client| client.client_user_id}

    filtered_user_ids = (messaged_user_ids.uniq - biz_clients_ids.uniq)|(biz_clients_ids.uniq - messaged_user_ids.uniq)

    messaged_users = []
    filtered_user_ids.each do |id|
      messaged_user = User.find(id)
      messaged_users.push(messaged_user)
    end

    render json: {client_users: client_users, messaged_users: messaged_users}
  end

  def client_params
    params.permit(:client_user_id, :business_id, :id, :user_id)
  end

  def define_current_client
    if params[:id]
      @current_client = Client.find(params[:id])
    else
      @current_client = Client.new
    end
  end

  def current_client
    @current_client
  end

end
