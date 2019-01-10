class Api::V1::ApplicationController < ApplicationController

  def check_authentication
    render json: {error: 'Please log in' }, status: 401
  end

end
