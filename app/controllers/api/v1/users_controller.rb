class Api::V1::UsersController < ApplicationController
    before_action :require_login, only: [:index, :profile, :create]

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: @user, status: :ok
        else
            render json: { status: 500, errors: ['user not found'] }
        end
    end

    def create
        user = User.create(user_params) 
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end


    private 

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :role_id)
    end
end
