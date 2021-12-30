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
    @response = HTTP.get("#{@link}#{@query}#{@fields}#{@max_results}")
    @response = @response.parse(:json)
    @books_list = @response["items"]
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

### Starts Program
puts "Welcome to Google Books Search, please enter your search query:"
query = gets.chomp().downcase.tr(" ","_")

## Creates new Search instance
current_search = Search.new(query)
search_results = current_search.books_list  ### Sets new search_results variable that will store @books_list for the BookList class

books_list = BookList.new(search_results)   ### Creates a BookList instance  which loads up the book_list from the previous search
books_list.list_books        ### lists the books in a user friendly manner
books = books_list.books     ### Creates the books variable that will store the 5 books in an array


# Creates a new Saved Books instance called saved_books
saved_books = SavedBook.new

while true

  puts "Which book would you like to save? Please enter 1-5"
  puts "If you do not wish to save a book please enter 'no'"
  book_number = gets.chomp()
  if book_number == 'no'
    puts "Thank you for using the Google Books Api, Goodbye"
    break
  elsif book_number == "1" || book_number == "2" || book_number == "3" || book_number == "4" || book_number == "5"
    book_number = book_number.to_i - 1
    true
  else
    puts "Input not recognized, please rerun app"
    break
  end
  book = books[book_number]
  saved_books.save_book(book)
  puts "Would you like to save another book? Yes/No"
  response = gets.chomp().downcase
  if response == "yes"
    true
  elsif response == "no"
    puts "Your saved books are:"
    break
  else
    puts "Input not recognized, please try again"
    true
  end

end

saved_books.list_saved_books