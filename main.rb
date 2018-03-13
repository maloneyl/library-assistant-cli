require "pry-byebug"
require_relative "lib/library_assistant"

book = LibraryAssistant.recommend_a_book

if book
  puts "#{book.title} – #{book.author} (#{book.year})"
  system("open #{book.link}")
else
  puts "Sorry, none of your recently added to-read books is available :("
end
