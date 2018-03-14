require_relative "library_assistant/goodreads"
require_relative "library_assistant/goodreads/book"
require_relative "library_assistant/islington_library"

module LibraryAssistant
  def self.grab_a_book
    found = false

    result = Goodreads.get_books.each do |goodreads_book|
      book = IslingtonLibrary.search(title: goodreads_book.title, author: goodreads_book.author)
      if book
        found = true
        break book
      end
    end

    found ? result : nil
  end
end
