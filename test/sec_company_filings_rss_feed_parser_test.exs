defmodule SecCompanyFilingsRssFeedParserTest do
  use ExUnit.Case

  import SecCompanyFilingsRssFeedParser

  test "parse!/1: parses RSS atom compliant XML" do
    xml = File.read!("test/fixtures/company_filings_rss_feed.xml")
    assert SecCompanyFilingsRssFeedParser.parse!(xml)
  end

  test "parse!/1: raises error on invalid XML" do
    xml = "naw"
    assert_raise ArgumentError, fn -> parse!(xml) end
  end

  test "has an entry" do
    {:ok, xml} = File.read("test/fixtures/company_filings_rss_feed.xml")
    {:ok, feed} = xml |> parse
    assert feed.entries
  end
end
