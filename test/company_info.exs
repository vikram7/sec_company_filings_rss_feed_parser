defmodule SecCompanyFilingsRssFeedParserCompanyInfoTest do
  use ExUnit.Case

  import SecCompanyFilingsRssFeedParser.CompanyInfo

  def company_info do
    """
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
    """
  end

  test "parses assigned-sic" do
  end
  test "parses assigned-sec-desc" do
  end
  test "parses assigned-sic-href" do
  end
  test "parses assitant director" do
  end
  test "parses cik" do
  end
  test "parses cik-href" do
  end
  test "parses conformed-name" do
  end
  test "parses fiscal-year-end" do
  end
  test "parses formerly-names count" do
  end
  test "parses formerly-names names" do
  end
  test "parses state-location" do
  end
  test "parses state-location-href" do
  end
  test "parses state-of-incorporation" do
  end
  test "parses addresses" do
  end
end
