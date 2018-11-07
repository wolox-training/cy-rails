module Api
  module V1
    class RentsController < ApiController
      before_action :current_user!
      before_action :set_locale, only: [:create]
      def index
        render_paginated authorize json: Rent.all
      end

      def create
        render authorize json: Rent.create!(rent_params)
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :init_date, :end_date)
      end
    end
  end
end
