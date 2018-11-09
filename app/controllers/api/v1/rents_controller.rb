module Api
  module V1
    class RentsController < ApiController
      before_action :authenticate_user!
      before_action :set_locale, only: [:create]
      def index
        render authorize json: current_user.rents
      end

      def create
        rent = Rent.new(rent_params)
        authorize rent
        rent.save!
        render json: rent, status: :created
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :init_date, :end_date)
      end
    end
  end
end
