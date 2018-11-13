require 'httparty'
module OpenLibraryService
  include HTTParty
  def book_info(isbn)
    base_uri = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response = HTTParty.get(base_uri, format: :json)
    valid_isbn(response, isbn)
  end

  private

  def valid_isbn(response, isbn)
    if response.keys.any?
      hash_info_book(response, isbn)
    else
      { message: 'Book information not found' }
    end
  end

  def hash_info_book(response, isbn)
    response_isbn = response[response.keys.first]
    {
      isbn: isbn,
      title: response_isbn['title'],
      subtitle: response_isbn['subtitle'],
      number_pages: response_isbn['number_of_pages'],
      authors: response_isbn['authors'].map { |a| a['name'] }
    }
  end
end
