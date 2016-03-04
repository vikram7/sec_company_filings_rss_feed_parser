defmodule SecCompanyFilingsRssFeedParserCompanyInfoTest do
  use ExUnit.Case

  import SecCompanyFilingsRssFeedParser.CompanyInfo

  def company_info_xml do
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
    company_info = company_info_xml |> parse
    assert company_info.assigned_sic == "7370"
  end

  test "parses assigned-sic-desc" do
    company_info = company_info_xml |> parse
    assert company_info.assigned_sic_desc == "SERVICES-COMPUTER PROGRAMMING, DATA PROCESSING, ETC."
  end

  test "parses assigned-sic-href" do
    company_info = company_info_xml |> parse
    assert company_info.assigned_sic_href == "http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&SIC=7370&owner=exclude&count=40"
  end

  test "parses assitant director" do
    company_info = company_info_xml |> parse
    assert company_info.assitant_director == "3"
  end

  test "parses cik" do
    company_info = company_info_xml |> parse
    assert company_info.cik == "0001418091"
  end

  test "parses cik-href" do
    company_info = company_info_xml |> parse
    assert company_info.cik_href == "http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&CIK=0001418091&owner=exclude&count=40"
  end

  test "parses conformed-name" do
    company_info = company_info_xml |> parse
    assert company_info.conformed_name == "TWITTER, INC."
  end

  test "parses fiscal-year-end" do
    company_info = company_info_xml |> parse
    assert company_info.fiscal_year_end == "1231"
  end

  test "parses state-location" do
    company_info = company_info_xml |> parse
    assert company_info.state_location == "CA"
  end

  test "parses state-location-href" do
    company_info = company_info_xml |> parse
    assert company_info.state_location_href == "http://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&State=CA&owner=exclude&count=40"
  end

  test "parses state-of-incorporation" do
    company_info = company_info_xml |> parse
    assert company_info.state_of_incorporation == "DE"
  end

  test "parses addresses" do
    company_info = company_info_xml |> parse
    assert company_info.addresses ==
      [
        %{
          type: "mailing",
          city: "San Francisco",
          state: "CA",
          street: "1355 MARKET STREET, SUITE 900",
          zip: "94103"
        },
        %{
          type: "business",
          phone: "(415) 222-9670",
          city: "San Francisco",
          state: "CA",
          street: "1355 MARKET STREET, SUITE 900",
          zip: "94103"
        }
      ]
  end
end
