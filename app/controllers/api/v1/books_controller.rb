class Api::V1::BooksController < ApplicationController
  include Wor::Paginate

  def show 
    @book = Book.find(params[:id])
    render_paginated json: @book
  end

  def index
    @books = Book.all
    render_paginated json: @books
  end
end
