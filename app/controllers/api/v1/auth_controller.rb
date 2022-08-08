class Api::V1::AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login
        user = User
                .select('*')
                .joins(:role)
                .find_by(email: params[:email])
                
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)

            render json: {
                user: user,
                token: token, 
                success: "Welcome back, #{user.first_name} #{user.last_name}"
            }, status: :ok
        else
            render json: {user: user, failure: "Login failed! email or password invalid!"}, status: :non_authoritative_information
        end
    end

    def auto_login
        if session_user
        render json: session_user
        else
        render json: {errors: "No User Logged In"}
        end
    end

    def user_is_authed
        render json: {message: "You are authorized"}
    end
end
