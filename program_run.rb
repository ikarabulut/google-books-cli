require "./google_books_api.rb"
require "http"

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