module BooksHelper

  def fetch_books
    books =  $redis.get("books")
    if books.nil?
      books = Book.all.to_json
      $redis.set("books", books)
    end
    @books = JSON.load books
  end

end
