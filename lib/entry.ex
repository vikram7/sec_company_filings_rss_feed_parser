defmodule SecCompanyFilingsRssFeedParser.Entry do
  @moduledoc """
  This module handles the parsing and creation of an
  entry map. An entry in the SEC's Company Filings RSS
  Feed is defined by the content between opening <entry>
  and closing </entry> tags
  """

  @doc """
  parse/1 takes an xml entry and parses it and returns a map of entry
  """

  use ParseUtility

  def parse(xml) do
    %{
      updated: parse_updated(xml),
      title: parse_title(xml),
      summary: parse_summary(xml),
      link: parse_link(xml),
      rss_feed_id: parse_rss_feed_id(xml),
      size: parse_size(xml),
      form_name: parse_form_name(xml),
      film_number: parse_film_number(xml),
      filing_type: parse_filing_type(xml),
      filing_date: parse_filing_date(xml),
      file_number_href: parse_file_name_href(xml),
      category_term: parse_category_term(xml),
      accession_nunber: parse_accession_nunber(xml),
      act: parse_act(xml),
      file_number: parse_file_number(xml)
    }
  end

  defp parse_updated(xml) do
    xml
    |> Floki.find("updated")
    |> extract_last_item()
  end

  defp parse_form_name(xml) do
    xml
    |> Floki.find("form-name")
    |> extract_last_item()
  end

  defp parse_title(xml) do
    xml
    |> Floki.find("title")
    |> extract_last_item()
  end

  defp parse_summary(xml) do
    {_, _, summary} = xml |> Floki.find("summary") |> hd
    Floki.raw_html(summary)
  end

  defp parse_link(xml) do
    {_, list, _} = xml |> Floki.find("link") |> hd
    {_, link} = list |> hd
    link
  end

  defp parse_rss_feed_id(xml) do
    xml
    |> Floki.find("id")
    |> extract_last_item()
  end

  defp parse_size(xml) do
    {_, _, size} = xml
    |> Floki.find("size")
    |> hd
    size
    |> hd
  end

  defp parse_film_number(xml) do
    xml
    |> Floki.find("film-number")
    |> extract_last_item()
  end

  defp parse_filing_type(xml) do
    xml
    |> Floki.find("filing-type")
    |> extract_last_item()
  end

  defp parse_filing_date(xml) do
    xml
    |> Floki.find("filing-date")
    |> extract_last_item()
  end

  defp parse_file_name_href(xml) do
    xml
    |> Floki.find("file-number-href")
    |> extract_last_item()
  end

  defp parse_category_term(xml) do
    {_, list, _} =
    xml
    |> Floki.find("category")
    |> hd

    {_, category_term} = list
    |> tl |> tl |> hd

    category_term
  end

  defp parse_accession_nunber(xml) do
    xml
    |> Floki.find("accession-nunber")
    |> extract_last_item()
  end

  defp parse_act(xml) do
    xml
    |> Floki.find("act")
    |> extract_last_item()
  end

  defp parse_file_number(xml) do
    xml
    |> Floki.find("file-number")
    |> extract_last_item()
  end
end
