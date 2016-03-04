defmodule SecCompanyFilingsRssFeedParserFeedTest do
  use ExUnit.Case

  import SecCompanyFilingsRssFeedParser.Feed

  def feed_xml do
    """
    <?xml version="1.0" encoding="ISO-8859-1" ?>
      <feed xmlns="http://www.w3.org/2005/Atom">
        <author>
          <email>webmaster@sec.gov</email>
          <name>Webmaster</name>
        </author>
        <company-info>
          <addresses>
            <address type="mailing">
              <city>San Francisco</city>
              <state>CA</state>
              <street1>1355 MARKET STREET, SUITE 900</street1>
              <zip>94103</zip>
            </address>
            <address type="business">
              <city>San Francisco</city>
              <phone>(415) 222-9670</phone>
              <state>CA</state>
              <street1>1355 MARKET STREET, SUITE 900</street1>
              <zip>94103</zip>
            </address>
          </addresses>
          <assigned-sic>7370</assigned-sic>
          <assigned-sic-desc>SERVICES-COMPUTER PROGRAMMING, DATA PROCESSING, ETC.</assigned-sic-desc>
          <assigned-sic-href>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;SIC=7370&amp;owner=exclude&amp;count=40</assigned-sic-href>
          <assitant-director>3</assitant-director>
          <cik>0001418091</cik>
          <cik-href>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091&amp;owner=exclude&amp;count=40</cik-href>
          <conformed-name>TWITTER, INC.</conformed-name>
          <fiscal-year-end>1231</fiscal-year-end>
          <formerly-names count="1">
            <names>
              <date>2010-01-08</date>
              <name>Twitter Inc</name>
            </names>
          </formerly-names>
          <state-location>CA</state-location>
          <state-location-href>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;State=CA&amp;owner=exclude&amp;count=40</state-location-href>
          <state-of-incorporation>DE</state-of-incorporation>
        </company-info>
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
        <entry>
          <category label="form type" scheme="http://www.sec.gov/" term="10-K" />
          <content type="text/xml">
            <accession-nunber>0001564590-16-013646</accession-nunber>
            <act>34</act>
            <file-number>001-36164</file-number>
            <file-number-href>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;filenum=001-36164&amp;owner=exclude&amp;count=40</file-number-href>
            <filing-date>2016-02-29</filing-date>
            <filing-href>http://www.sec.gov/Archives/edgar/data/1418091/000156459016013646/0001564590-16-013646-index.htm</filing-href>
            <filing-type>10-K</filing-type>
            <film-number>161464790</film-number>
            <form-name>Annual report [Section 13 and 15(d), not S-K Item 405]</form-name>
            <size>15 MB</size>
            <xbrl_href>http://www.sec.gov/cgi-bin/viewer?action=view&amp;cik=1418091&amp;accession_number=0001564590-16-013646&amp;xbrl_type=v</xbrl_href>
          </content>
          <id>urn:tag:sec.gov,2008:accession-number=0001564590-16-013646</id>
          <link href="http://www.sec.gov/Archives/edgar/data/1418091/000156459016013646/0001564590-16-013646-index.htm" rel="alternate" type="text/html" />
          <summary type="html"> &lt;b&gt;Filed:&lt;/b&gt; 2016-02-29 &lt;b&gt;AccNo:&lt;/b&gt; 0001564590-16-013646 &lt;b&gt;Size:&lt;/b&gt; 15 MB</summary>
          <title>10-K  - Annual report [Section 13 and 15(d), not S-K Item 405]</title>
          <updated>2016-02-29T07:01:57-05:00</updated>
        </entry>
        <id>http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091</id>
        <link href="http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091&amp;owner=exclude&amp;start=0&amp;count=40" rel="alternate" type="text/html" />
        <link href="http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091&amp;owner=exclude&amp;start=0&amp;count=40&amp;output=atom" rel="self" type="application/atom+xml" />
        <link href="http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091&amp;type=&amp;datea=&amp;dateb=&amp;owner=exclude&amp;count=40&amp;output=atom&amp;start=40" rel="next" type="application/atom+xml" />
        <title>TWITTER, INC.  (0001418091)</title>
        <updated>2016-03-03T18:20:09-05:00</updated>
      </feed>
    """
  end

  test "parse/1" do
    feed = feed_xml |> SecCompanyFilingsRssFeedParser.Feed.parse

    assert feed == %{
      updated: "2016-03-03T18:20:09-05:00",
      title: "TWITTER, INC.  (0001418091)",
      feed_id: "http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&amp;CIK=0001418091",
      entries: [
        %{},
        %{}
      ]
    }
  end
end
