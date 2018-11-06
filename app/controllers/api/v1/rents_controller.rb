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
    end
  end
end
