class Api::V1::AuthController < Api::V1::ApplicationController
    skip_before_action :check_authentication

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {
                token: JWT.encode({ user_id: user.id }, ENV["my_apps_secret"]),
                id: user.id,
                first_name: user.first_name,
                last_name: user.last_name,
                email: user.email,
                latitude: user.latitude,
                longitude: user.longitude
            }
        else
            render json: {
                error: 'email or password are incorrect'
            }
        end
    end

end
