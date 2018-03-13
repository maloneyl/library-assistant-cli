require_relative "../book"

module LibraryAssistant
  class IslingtonLibrary
    class QueryResult
      def initialize(parsed_query_result_xml)
        @doc = parsed_query_result_xml
      end

      def book
        return nil unless any?

        Book.new(
          title: value_for_newest_item("rss:title"),
          author: value_for_newest_item("dc:creator"),
          year: value_for_newest_item("dc:date"),
          link: value_for_newest_item("rss:link")
        )
      end

      private

      def any?
        @doc.xpath("//rss:channel/os:totalResults").text.to_i > 0
      end

      def newest_item
        @item ||= @doc.xpath("//rss:item/dc:date").
          sort_by{ |el| el.text }.
          reverse.
          first.
          parent
      end

      def value_for_newest_item(xpath)
        newest_item.xpath(xpath).text
      end
    end
  end
end
