class Api::V1::GenresController < ApplicationController

    before_action :require_login, only: [:index, :show, :create, :update, :destroy]
    before_action :set_genre, only: [:show, :update, :destroy]

    # GET /api/v1/genres
    def index
        @genres = Genre.all
        render json: @genres
    end
    
    # GET /api/v1/genres/1
    def show
        if @genre
            render json: @genre
        else
            render json: {}
        end
    end

    # POST /api/v1/genres
    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            render json: @genre, status: :created, location: @genre
        else
            render json: @genre.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/genres/1
    def update
      if @genre.update(genre_params)
        render json: @genre
      else
        render json: @genre.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/genres/1
    def destroy
        @genre.destroy
        head :no_content
    end
  
    private
    
        def set_genre
            if Genre.exists?(params[:id])
                @genre = Genre.find(params[:id])
            end
        end
  
        def genre_params
            params.require(:genre).permit(:genre_name)
        end

end
