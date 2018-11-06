module Api
  module V1
    class BooksController < ApiController
      before_action :current_user
      def show
        render json: Book.find(params[:id])
      end

      def index
        render json: Book.all
      end
    end
  end
end
