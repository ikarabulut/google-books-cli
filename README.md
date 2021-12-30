<h1>READ ME</h1>

<h3>Requirements</h3>
- Latest Ruby Version

To Download Latest Ruby version please follow RBENV installation method found here: https://github.com/rbenv/rbenv#installation

Steps

1. In your terminal please navigate to the root directory where you would like this program to live
2. Once in root directory please clone down the repository running
`git clone https://github.com/ikarabulut/google-books-cli.git`
3. Enter the folder: run `cd google-books-cli` in your terminal
4. Run `bundle install` to install needed gems
6. Run the program by executing: 'ruby program_run.rb' in the root folder
7. Please follow prompts within your terminal to use the app!

<h2>Program details</h2>

<h3>Files</h3>

<h4>google_books_api.rb</h4>
This file houses all of your classes needed for this program.
The classes are:
- `Search`
This class houses all of your search parameters including:

  `@query = query` This is the query that will be asked in the first user prompt when `program_run.rb` is ran
  `@link = "https://www.googleapis.com/books/v1/volumes?q=title:"` This is the link for the Google Books API call as of 12/30/21. Please refer to https://developers.google.com/books/docs/v1/using#PerformingSearch for more details on the api.
  `@fields = "&fields=items(volumeInfo/title,volumeInfo/authors,volumeInfo/publisher)"` This will limit the response to the parameters listed within the parenthesis. Please refer to https://developers.google.com/books/docs/v1/using#api_params for more details
  `@max_results = "&maxResults=5"` Same as above but limits total results to 5.
  `@response` Allows the response to be accessed outside of the class in `program_run.rb`
  `@books_list` Allows this variable to be accessed outside of the class in `program_run.rb`
    
- `BookList`
This class takes the 5 books from `@books_list` parses their data a bit more in the `initialize` method and adds the parsed data to the `@books` array as an array of objects.

The `list_books` method will take the data from the `@books` array and present it to the user in a more user friendly manner.

- `SavedBook`
This class will take the info from the `@books` array and allow the user to save the books of their choosing to the `@saved_books` array. The meat of the `save_book` method within this class is done outside of the class in the `program_run.rb` which loops through a `while` loop allowing the user to input the book number they would want to add until they exit that loop through a listed command.

<h4>program_run.rb</h4>
This file will walk the user through their journey. It can only be ran once. If you have any ideas into allowing a user to perform multiple searches and add to a single saved books list please let me know!

<h4>test.rb</h4>
This file will run three automated tests to ensure crucial methods are still running properly. DO NOT ALTER THIS FILE.
To run a test run `ruby test.rb` from your root directory.


