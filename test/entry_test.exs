defmodule SecCompanyFilingsRssFeedParserEntryTest do
  use ExUnit.Case

  import SecCompanyFilingsRssFeedParser.Entry

  def entry_xml do
    """
    <entry>
      <category label="form type" scheme="http://www.sec.gov/" term="S-8" />
      <content type="text/xml">
        <accession-nunber>0001564590-16-013773</accession-nunber>
        <act>33</act>
        <file-number>333-209840</file-number>
        <file-number-href>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;filenum=333-209840&amp;owner=exclude&amp;count=40</file-number-href>
        <filing-date>2016-03-01</filing-date>
        <filing-href>http://www.sec.gov/Archives/edgar/data/1418091/000156459016013773/0001564590-16-013773-index.htm</filing-href>
        <filing-type>S-8</filing-type>
        <film-number>161470856</film-number>
        <form-name>Securities to be offered to employees in employee benefit plans</form-name>
        <size>146 KB</size>
      </content>
      <id>urn:tag:sec.gov,2008:accession-number=0001564590-16-013773</id>
      <link href="http://www.sec.gov/Archives/edgar/data/1418091/000156459016013773/0001564590-16-013773-index.htm" rel="alternate" type="text/html" />
      <summary type="html"> &lt;b&gt;Filed:&lt;/b&gt; 2016-03-01 &lt;b&gt;AccNo:&lt;/b&gt; 0001564590-16-013773 &lt;b&gt;Size:&lt;/b&gt; 146 KB</summary>
      <title>S-8  - Securities to be offered to employees in employee benefit plans</title>
      <updated>2016-03-01T06:02:42-05:00</updated>
    </entry>
    """
  end

  test "parses updated date" do
    entry = entry_xml() |> parse
    assert entry.updated == "2016-03-01T06:02:42-05:00"
  end

  test "parses title" do
    entry = entry_xml() |> parse
    assert entry.title == "S-8  - Securities to be offered to employees in employee benefit plans"
  end

  test "parses summary" do
    entry = entry_xml() |> parse
    assert entry.summary == " <b>Filed:</b> 2016-03-01 <b>AccNo:</b> 0001564590-16-013773 <b>Size:</b> 146 KB"
  end

  test "parses link" do
    entry = entry_xml() |> parse
    assert entry.link == "http://www.sec.gov/Archives/edgar/data/1418091/000156459016013773/0001564590-16-013773-index.htm"
  end

  test "parses rss_feed_id" do
    entry = entry_xml() |> parse
    assert entry.rss_feed_id == "urn:tag:sec.gov,2008:accession-number=0001564590-16-013773"
  end

  test "parses size" do
    entry = entry_xml() |> parse
    assert entry.size == "146 KB"
  end

  test "parses form-name" do
    entry = entry_xml() |> parse
    assert entry.form_name == "Securities to be offered to employees in employee benefit plans"
  end

  test "parses film-number" do
    entry = entry_xml() |> parse
    assert entry.film_number == "161470856"
  end

  test "parsess filing-type" do
    entry = entry_xml() |> parse
    assert entry.filing_type == "S-8"
  end

  test "parses filing-date" do
    entry = entry_xml() |> parse
    assert entry.filing_date == "2016-03-01"
  end

  test "parses file-number-href" do
    entry = entry_xml() |> parse
    assert entry.file_number_href == "http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&filenum=333-209840&owner=exclude&count=40"
  end

  test "parses category term" do
    entry = entry_xml() |> parse
    assert entry.category_term == "S-8"
  end

  test "parses accession nunber" do
    entry = entry_xml() |> parse
    assert entry.accession_nunber == "0001564590-16-013773"
  end

  test "parses act" do
    entry = entry_xml() |> parse
    assert entry.act == "33"
  end

  test "parses file-number" do
    entry = entry_xml() |> parse
    assert entry.file_number == "333-209840"
  end
end
