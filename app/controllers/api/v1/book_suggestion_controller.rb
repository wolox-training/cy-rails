module Api
  module V1
    class BookSuggestionController < ApiController
      def create
        render json: BookSuggestion.create!(book_suggestion_params), status: :created
      end

      def book_suggestion_params
        params.require(:book_suggestion).permit(:author, :title, :link,
                                                :publisher, :year, :user_id)
      end
    end
  end
end
