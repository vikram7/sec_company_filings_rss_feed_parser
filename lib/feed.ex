defmodule SecCompanyFilingsRssFeedParser.Feed do
  @moduledoc false

  use ParseUtility

  alias SecCompanyFilingsRssFeedParser.{CompanyInfo, Entry}

  def parse(xml) do
    %{
      updated: parse_updated(xml),
      title: parse_title(xml),
      author_name: parse_author_name(xml),
      author_email: parse_author_email(xml),
      entries: parse_entries(xml),
      company_info: parse_company_info(xml)
    }
  end

  defp parse_entries(xml) do
    xml
    |> Floki.find("entry")
    |> Enum.map(fn entry -> Entry.parse(Floki.raw_html(entry)) end)
  end

  defp parse_company_info(xml) do
    xml
    |> Floki.find("company-info")
    |> Floki.raw_html
    |> CompanyInfo.parse
  end

  defp parse_updated(feed) do
    {_, _, [date]} =
    feed
    |> Floki.find("updated")
    |> List.last

    date
  end

  defp parse_title(feed) do
    {_, _, [title]} =
    feed
    |> Floki.find("title")
    |> List.last

    title
  end

  defp parse_author_name(feed) do
    feed
    |> Floki.find("author name")
    |> extract_last_item()
  end

  defp parse_author_email(feed) do
    feed
    |> Floki.find("author email")
    |> extract_last_item()
  end
end
