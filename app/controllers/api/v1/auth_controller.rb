class Api::V1::AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            
            render json: {
                user: user, 
                jwt: token, 
                success: "Welcome back, #{user.first_name} #{user.last_name}"
            }
        else
            render json: {user: user, failure: "Log in failed! email or password invalid!"}
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
