class Api::V1::RolesController < ApplicationController
    
    before_action :require_login, only: [:index, :show, :create, :update, :destroy]
    before_action :set_role, only: [:show, :update, :destroy]

    # GET /api/v1/roles
    def index
        @roles = Role.all
        render json: @roles
    end
    
    # GET /api/v1/roles/1
    def show
        if @role
            render json: @role
        else
            render json: {}
        end
    end

    # POST /api/v1/roles
    def create
        @role = Role.new(role_params)

        if @role.save
            render json: @role, status: :created, location: @role
        else
            render json: @role.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/roles/1
    def update
      if @role.update(role_params)
        render json: @role
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/roles/1
    def destroy
        @role.destroy
        head :no_content
    end
  
    private
    
        def set_role
            if Role.exists?(params[:id])
                @role = Role.find(params[:id])
            end
        end
  
        def role_params
            params.require(:role).permit(:role_name)
        end
end
