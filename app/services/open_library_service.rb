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

  def get_title(response_isbn)
    response_isbn['title']
  end

  def get_subtitle(response_isbn)
    response_isbn['subtitle']
  end

  def get_number_pages(response_isbn)
    response_isbn['number_of_pages']
  end

  def get_authors(response_isbn)
    authors = []
    response_isbn['authors'].each do |aut|
      authors << aut['name']
    end
    authors
  end
end
