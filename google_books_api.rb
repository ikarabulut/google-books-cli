require "http"

class Search
  attr_accessor :query, :link, :fields, :max_results, :response, :books_list

  def initialize(query)
    @query = query
    @link = "https://www.googleapis.com/books/v1/volumes?q=title:"
    @fields = "&fields=items(volumeInfo/title,volumeInfo/authors,volumeInfo/publisher)"
    @max_results = "&maxResults=5"
    @response
    @books_list
    response
  end

  def response
    test_response = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=test")
    if test_response.status == 200
      @response = HTTP.get("#{@link}#{@query}#{@fields}#{@max_results}")
      @response = @response.parse(:json)
      @books_list = @response["items"]
    else
      p "Whoops something went wrong, please try again later"
      exit
    end
  end

end

class BookList
attr_accessor :books_list, :books
  def initialize(books_list)
    @books_list = books_list
    @books = []
    @books << @books_list[0]["volumeInfo"]
    @books << @books_list[1]["volumeInfo"]
    @books << @books_list[2]["volumeInfo"]
    @books << @books_list[3]["volumeInfo"]
    @books << @books_list[4]["volumeInfo"]
  end

  def list_books
    i = 1
    books.each do |book|
      puts "Book #{i}"
      puts "Title: #{book["title"]}"
      puts "Author(s): #{book["authors"]}"
      puts "Publisher: #{book["publisher"]}"
      puts "-------------------------"
      i += 1
    end
  end
end

class SavedBook
attr_accessor :saved_books, :book
  def initialize
    @saved_books = []
  end

  def save_book(book)
    @book = book
    @saved_books << @book
  end

  def list_saved_books
    i = 1
    saved_books.each do |book|
      puts "Saved Book #{i}"
      puts "Title: #{book["title"]}"
      puts "Author(s): #{book["authors"]}"
      puts "Publisher: #{book["publisher"]}"
      puts "-------------------------"
      i += 1
    end
  end

end