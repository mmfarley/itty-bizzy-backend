class Api::V1::ClientsController < Api::V1::ApplicationController

  before_action :define_current_client

  def client_users
    clients = Client.where(business_id: params[:business_id])
    client_users = clients.map{|client| [User.find(client.client_user_id), client.id]}
    render json: client_users
  end

  def create
    client = Client.create(client_params)
    render json: client
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
    render json: current_client
  end

  def client_params
    params.permit(:client_user_id, :business_id, :id)
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
