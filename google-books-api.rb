require "http"

class Google_books_api
  def initialize
    @link = "https://www.googleapis.com/books/v1/volumes?q="
    @parameters = ["Author", "Title", "Publisher", "Subject"]
    @query
    @author
    @title
    @publisher
    @subject
    @response
    @book1 = {}
    @book2 = {}
    @book3 = {}
    @book4 = {}
    @book5 = {}
    @books_list = []
    @saved_books = []
  end

  def start_search
    puts "Please enter your search query:"
    @query = gets.chomp().downcase.tr(" ","_")
    puts "Which additional parameter would you like to search by?"
    puts @parameters
    puts "Please type your selection:"
    parameter = gets.chomp().downcase
    if parameter == "author"
      author_search
    elsif parameter == "title"
      title_search
    elsif parameter == "publisher"
      publisher_search
    elsif parameter == "subject"
      subject_search
    else
      puts "Input not recognized, please rerun app"
    end

  end

  def author_search
    puts "Please enter author:"
    @author = "inauthor:" + gets.chomp().downcase.tr(" ","_")
    @response = HTTP.get("#{@link}#{@query}&#{@author}.json")
    book1
  end

  def title_search
    puts "Please enter title:"
    @title = "intitle:" + gets.chomp().downcase.tr(" ","_")
    @response = HTTP.get("#{@link}#{@query}&#{@title}.json")
    book1
  end

  def publisher_search
    puts "Please enter publisher:"
    @publisher = "inpublisher:" + gets.chomp().downcase.tr(" ","_")
    @response = HTTP.get("#{@link}#{@query}&#{@publisher}.json")
    book1
  end

  def subject_search
    puts "Please enter subject:"
    @subject = "subject:" + gets.chomp().downcase.tr(" ","_")
    @response = HTTP.get("#{@link}#{@query}&#{@subject}.json")
    book1
  end

  def book1
    @response = @response.parse(:json)
    @book1["title"] = @response["items"][0]["volumeInfo"]["title"]
    @book1["author"] = @response["items"][0]["volumeInfo"]["authors"]
    @book1["publisher"] = @response["items"][0]["volumeInfo"]["publisher"]
    book2
  end

  def book2
    @response
    @book2["title"] = @response["items"][1]["volumeInfo"]["title"]
    @book2["author"] = @response["items"][1]["volumeInfo"]["authors"]
    @book2["publisher"] = @response["items"][1]["volumeInfo"]["publisher"]
    book3
  end

  def book3
    @response
    @book3["title"] = @response["items"][2]["volumeInfo"]["title"]
    @book3["author"] = @response["items"][2]["volumeInfo"]["authors"]
    @book3["publisher"] = @response["items"][2]["volumeInfo"]["publisher"]
    book4
  end

  def book4
    @response
    @book4["title"] = @response["items"][3]["volumeInfo"]["title"]
    @book4["author"] = @response["items"][3]["volumeInfo"]["authors"]
    @book4["publisher"] = @response["items"][3]["volumeInfo"]["publisher"]
    book5
  end

  def book5
    @response
    @book5["title"] = @response["items"][4]["volumeInfo"]["title"]
    @book5["author"] = @response["items"][4]["volumeInfo"]["authors"]
    @book5["publisher"] = @response["items"][4]["volumeInfo"]["publisher"]
    list_books
  end

  def list_books
    @books_list << @book1
    @books_list << @book2
    @books_list << @book3
    @books_list << @book4
    @books_list << @book5
    puts @books_list
    save
  end

  def save
    i = 0
    while i < 5
      puts "Would you like to save #{@books_list[i]["title"]}? (y/n)"
      answer = gets.chomp().downcase
      if answer == "y"
        @saved_books << @books_list[i]
      end
      i += 1
    end
    puts "Your saved books are:"
    puts @saved_books
  end

end

new_search = Google_books_api.new
new_search.start_search