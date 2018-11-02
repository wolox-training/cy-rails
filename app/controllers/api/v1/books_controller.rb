module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_api_v1_user!
      def show
        render json: Book.find(params[:id])
      end

      def index
        render json: Book.all
      end
    end
  end
end
