require_relative "library_assistant/goodreads"
require_relative "library_assistant/islington_library"

module LibraryAssistant
  def self.recommend_a_book
    book = Goodreads.books.each do |book|
      title = book.book.title
      author = book.book.authors.author.name

      result = IslingtonLibrary.search(title: title, author: author)
      break result if result
    end

    book
  end
end
