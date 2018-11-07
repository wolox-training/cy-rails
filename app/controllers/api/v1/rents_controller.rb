module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_api_v1_user!
      def index
        render json: Rent.all
      end

      def create
        render json: Rent.create!(rent_params)
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :init_date, :end_date)
      end
    end
  end
end
