##############################
### DO NOT ALTER THIS FILE ###
##############################
require "./google_books_api.rb"

### Tests # of books in response
puts "This test will ensure your response is getting the right number of books, Should be 5"
test_search = Search.new("hail_mary")
test_results = test_search.books_list
if test_results.length == 5
  puts "Your search returned the right amount of books"
else
  puts "Your search did not return 5 books, it returned #{test_results.books_list.length}"
end

### Tests BookList.list_books method ensuring the proper data is being passed through
puts "This test will ensure the 5 books are being added to the @books array"
test_book_list = BookList.new([{"volumeInfo"=>{"title"=>"Hail Mary", "authors"=>["Britni de la Cretaz", "Lyndsey D'Arcangelo"], "publisher"=>"Hachette UK"}}, {"volumeInfo"=>{"title"=>"Project Hail Mary", "authors"=>["Andy Weir"]}}, {"volumeInfo"=>{"title"=>"Jean-Luc Godard's Hail Mary", "authors"=>["Visiting Assistant Professor of Film Studies Charles Warren", "Anne-Marie Mieville"], "publisher"=>"SIU Press"}}, {"volumeInfo"=>{"title"=>"Hail Mary?", "authors"=>["Maurice Hamington"], "publisher"=>"Routledge"}}, {"volumeInfo"=>{"title"=>"Hail Mary", "authors"=>["Nicola Rendell"], "publisher"=>"Createspace Independent Publishing Platform"}}])
### These are the resposne arrays and they should match up
expected_response = [{"title"=>"Hail Mary", "authors"=>["Britni de la Cretaz", "Lyndsey D'Arcangelo"], "publisher"=>"Hachette UK"}, {"title"=>"Project Hail Mary", "authors"=>["Andy Weir"]}, {"title"=>"Jean-Luc Godard's Hail Mary", "authors"=>["Visiting Assistant Professor of Film Studies Charles Warren", "Anne-Marie Mieville"], "publisher"=>"SIU Press"}, {"title"=>"Hail Mary?", "authors"=>["Maurice Hamington"], "publisher"=>"Routledge"}, {"title"=>"Hail Mary", "authors"=>["Nicola Rendell"], "publisher"=>"Createspace Independent Publishing Platform"}]

if expected_response == test_book_list.books
  puts "Test Passed"
else
  puts "Test Failed, expected result was:"
  puts expected_response
  puts "But the test_response was:"
  puts test_book_list.books
end

### Tests SavedBook save_book method.
test_saved_books = SavedBook.new
test_book ={"title"=>"Hail Mary", "authors"=>["Britni de la Cretaz", "Lyndsey D'Arcangelo"], "publisher"=>"Hachette UK"}
test_saved_books.save_book(test_book)
puts "This test will check to make sure the correct book is being added to the saved books array"
if test_book  == test_saved_books.saved_books[0]
  puts "test passed"
else
  puts "Test Failed"
  puts "Your expected result was:"
  puts test_book
  puts "But the test result was:"
  puts test_saved_books.saved_books
end






