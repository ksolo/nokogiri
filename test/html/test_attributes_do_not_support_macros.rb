require "helper"

module Nokogiri
  module HTML
    class TestAttributesDoNotSupportMacros < Nokogiri::TestCase
      def test_attribute_macros_are_escaped
        html = "<p><i for=\"&{<test>}\"></i></p>"
        document = Nokogiri::HTML::Document.new
        nodes = document.parse(html)

        assert_equal "<p><i for=\"&amp;{&lt;test&gt;}\"></i></p>", nodes[0].to_s
      end
    end
  end
end
