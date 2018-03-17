require "pry-byebug"
require "library_assistant"

book = LibraryAssistant.grab_a_book

if book
  puts "#{book.title} – #{book.author} (#{book.year})"
  system("open #{book.link}")
else
  puts "Sorry, none of your recently added books is available :("
end
