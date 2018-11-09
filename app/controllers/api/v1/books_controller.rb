module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_user!
      def show
        render json: Book.find(params[:id])
      end

      def index
        render_paginated json: Book.all
      end
    end
  end
end
