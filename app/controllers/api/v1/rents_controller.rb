module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_api_v1_user!
      def index
        @rents = Rent.all
        render json: @rents
      end

      def create
        @rents = Rent.new(params[:rent])
        if @rents.save
          render json: @rents
        else
          render 'new'
        end
      end
    end
  end
end
