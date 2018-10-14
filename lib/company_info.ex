defmodule SecCompanyFilingsRssFeedParser.CompanyInfo do
  @moduledoc false

  use ParseUtility

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

  defp parse_assigned_sic(xml) do
    xml
    |> Floki.find("assigned-sic")
    |> extract_last_item
  end

  defp parse_assigned_sic_desc(xml) do
    xml
    |> Floki.find("assigned-sic-desc")
    |> extract_last_item
  end

  defp parse_assigned_sic_href(xml) do
    xml
    |> Floki.find("assigned-sic-href")
    |> extract_last_item
  end

  defp parse_assitant_director(xml) do
    xml
    |> Floki.find("assitant-director")
    |> extract_last_item
  end

  defp parse_cik(xml) do
    xml
    |> Floki.find("cik")
    |> extract_last_item
  end

  defp parse_cik_href(xml) do
    xml
    |> Floki.find("cik-href")
    |> extract_last_item
  end

  defp parse_conformed_name(xml) do
    xml
    |> Floki.find("conformed-name")
    |> extract_last_item
  end

  defp parse_fiscal_year_end(xml) do
    xml
    |> Floki.find("fiscal-year-end")
    |> extract_last_item
  end

  defp parse_state_location(xml) do
    xml
    |> Floki.find("state-location")
    |> extract_last_item
  end

  defp parse_state_location_href(xml) do
    xml
    |> Floki.find("state-location-href")
    |> extract_last_item
  end

  defp parse_state_of_incorporation(xml) do
    xml
    |> Floki.find("state-of-incorporation")
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
