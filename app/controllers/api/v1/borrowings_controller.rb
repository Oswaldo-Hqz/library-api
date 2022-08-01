class Api::V1::BorrowingsController < ApplicationController

    before_action :require_login, only: [:index, :profile, :user_by_Email, :create]
    
    def index
        @borrowing = Borrowing
                    .select('borrowings.id, borrowings.book_id, borrowings.user_id, 
                             books.title, books.author, genres.genre_name, 
                             users.first_name, users.last_name, users.email, roles.role_name')
                    .joins("INNER JOIN books ON borrowings.book_id = books.id 
                            INNER JOIN users ON borrowings.user_id = users.id 
                            INNER JOIN genres ON books.genre_id = genres.id 
                            INNER JOIN roles ON users.role_id = roles.id")
        if @user
            render json: @user, status: :ok
        else
            render json: { status: 500, errors: ['user not found'] }
        end
    end

    def show
        @borrowing = Borrowing
                    .select('borrowings.id, borrowings.book_id, borrowings.user_id, 
                             books.title, books.author, genres.genre_name, 
                             users.first_name, users.last_name, users.email, roles.role_name')
                    .joins("INNER JOIN books ON borrowings.book_id = books.id 
                            INNER JOIN users ON borrowings.user_id = users.id 
                            INNER JOIN genres ON books.genre_id = genres.id 
                            INNER JOIN roles ON users.role_id = roles.id")
                    .where("borrowings.id = ?", params[:id])
        if @user
            render json: @user, status: :ok
        else
            render json: { status: 500, errors: ['user not found'] }
        end
    end

    def create
        @borrowing = Borrowing.new(params[:book_id], params[:user_id], release_date: Time.now.to_datetime)

        if @borrowing.save
            render json: @borrowing, status: :created, location: @borrowing
        else
            render json: @borrowing.errors, status: :unprocessable_entity
        end
    end

    def update
        @borrowing = Borrowing.find(params[:id])
        if @borrowing.update(params[:book_id], params[:user_id], release_date: Time.now.to_datetime)
          render json: @borrowing
        else
          render json: @borrowing.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @borrowing = Borrowing.find(params[:id])
        @borrowing.destroy
        head :no_content
    end

    def return_book
        @borrowing = Borrowing.find(params[:id])
        if @borrowing.update(due_date: Time.now.to_datetime)
            render json: @borrowing
        else
            render json: @borrowing.errors, status: :unprocessable_entity
        end
    end
end
