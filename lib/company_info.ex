defmodule SecCompanyFilingsRssFeedParser.CompanyInfo do

  def parse(xml) do
    %{
      assigned_sic: parse_assigned_sic(xml),
      assigned_sic_desc: parse_assigned_sic_desc(xml),
      assigned_sic_href: parse_assigned_sic_href(xml),
      assitant_director: parse_assitant_director(xml),
      cik: parse_cik(xml),
      cik_href: parse_cik_href(xml),
      conformed_name: parse_conformed_name(xml),
      fiscal_year_end: parse_fiscal_year_end(xml),
      state_location: parse_state_location(xml),
      state_location_href: parse_state_location_href(xml),
      state_of_incorporation: parse_state_of_incorporation(xml),
      addresses: parse_addresses(xml)
    }
  end

  def extract_last_item(tuple) do
    {_, _, item} = tuple
    item |> hd
  end

  defp parse_assigned_sic(xml) do
    xml
    |> Floki.find("assigned-sic")
    |> hd
    |> extract_last_item
  end

  defp parse_assigned_sic_desc(xml) do
    xml
    |> Floki.find("assigned-sic-desc")
    |> hd
    |> extract_last_item
  end

  defp parse_assigned_sic_href(xml) do
    xml
    |> Floki.find("assigned-sic-href")
    |> hd
    |> extract_last_item
  end

  defp parse_assitant_director(xml) do
    xml
    |> Floki.find("assitant-director")
    |> hd
    |> extract_last_item
  end

  defp parse_cik(xml) do
    xml
    |> Floki.find("cik")
    |> hd
    |> extract_last_item
  end

  defp parse_cik_href(xml) do
    xml
    |> Floki.find("cik-href")
    |> hd
    |> extract_last_item
  end

  defp parse_conformed_name(xml) do
    xml
    |> Floki.find("conformed-name")
    |> hd
    |> extract_last_item
  end

  defp parse_fiscal_year_end(xml) do
    xml
    |> Floki.find("fiscal-year-end")
    |> hd
    |> extract_last_item
  end

  defp parse_state_location(xml) do
    xml
    |> Floki.find("state-location")
    |> hd
    |> extract_last_item
  end

  defp parse_state_location_href(xml) do
    xml
    |> Floki.find("state-location-href")
    |> hd
    |> extract_last_item
  end

  defp parse_state_of_incorporation(xml) do
    xml
    |> Floki.find("state-of-incorporation")
    |> hd
    |> extract_last_item
  end

  defp parse_addresses(xml) do
    [{"addresses", [],
        [{"address", [{"type", type1}],
            [{"city", [], [city1]}, {"state", [], [state1]},
              {"street1", [], [street1]},
              {"zip", [], [zip1]}]},
          {"address", [{"type", type2}],
            [{"city", [], [city2]}, {"phone", [],
                [phone]},
              {"state", [], [state2]}, {"street1", [],
                [street2]},
              {"zip", [], [zip2]}]}]}] = xml |> Floki.find("addresses")

    [
      %{
        type: type1,
        city: city1,
        state: state1,
        street: street1,
        zip: zip1
      },
      %{
        type: type2,
        city: city2,
        phone: phone,
        state: state2,
        street: street2,
        zip: zip2
      }
    ]
  end
end

