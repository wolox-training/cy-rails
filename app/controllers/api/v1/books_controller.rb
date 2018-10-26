module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_api_v1_user!
      def show
        @book = Book.find(params[:id])
        render json: @book
      end

      def index
        @books = Book.all
        render json: @books
      end
    end
  end
end
