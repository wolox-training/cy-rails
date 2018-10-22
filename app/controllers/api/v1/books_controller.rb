module Api
  module V1
    class BooksController < ApplicationController
      def show
        @book = Book.find(params[:id])
        render_paginated json: @book
      end

      def index
        @books = Book.all
        render_paginated json: @books
      end
    end
  end
end
