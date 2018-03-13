require "nokogiri"
require_relative "../../../lib/library_assistant/islington_library/query_result"

RSpec.describe LibraryAssistant::IslingtonLibrary::QueryResult do
  describe "#book" do
    let(:parsed_query_result_xml) do
      Nokogiri::XML(File.read(File.expand_path(query_result_file_path, File.dirname(__FILE__))))
    end

    context "when there are items in the query result" do
      let(:query_result_file_path) { "../../fixtures/islington_library_query_results/with_two_items.xml" }

      it "returns the newer book" do
        book = described_class.new(parsed_query_result_xml).book

        expect(book.year).to eq("2015")
        expect(book.link).to eq("http://capitadiscovery.co.uk/islington/items/872958")
      end
    end

    context "when there are no items in the query result" do
      let(:query_result_file_path) { "../../fixtures/islington_library_query_results/with_zero_items.xml" }

      it "returns nil" do
        book = described_class.new(parsed_query_result_xml).book

        expect(book).to be_nil
      end
    end
  end
end
