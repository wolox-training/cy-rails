module Api
  module V1
    class BooksController < ApiController
      before_action :authenticate_user!
      include OpenLibraryService
      def show
        render json: Book.find(params[:id])
      end

      def index
        render_paginated json: Book.all
      end

      def book_info_external
        render json: book_info(params[:isbn])
      end
    end
  end
end
