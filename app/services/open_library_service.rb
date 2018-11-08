require 'httparty'
module OpenLibraryService
  include HTTParty
  def book_info(isbn)
    base_uri = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response = HTTParty.get(base_uri, format: :json)
    valid_isbn(response)
  end

  private

  def valid_isbn(response)
    if response.keys.any?
      hash_info_book(response)
    else
      []
    end
  end

  def hash_info_book(response)
    response_isbn = response[response.keys.first]
    info_external_books = Hash[isbn: response.keys.first,
                               title: get_title(response_isbn),
                               subtitle: get_subtitle(response_isbn),
                               number_pages: get_number_pages(response_isbn),
                               authors: get_authors(response_isbn)]

    info_external_books
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
