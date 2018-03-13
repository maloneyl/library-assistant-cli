require "goodreads"
require "dotenv/load"

module LibraryAssistant
  class Goodreads
    class << self
      def books
        client.shelf(ENV["GOODREADS_USER_ID"], ENV["GOODREADS_TO_READ_SHELF_NAME"]).books
      end

      private

      def client
        @client ||= ::Goodreads.new(api_key: ENV["GOODREADS_API_KEY"])
      end
    end
  end
end
