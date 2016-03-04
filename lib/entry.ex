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

  def extract_last_item(tuple) do
    {_, _, item} = tuple
    item |> hd
  end

  defp parse_updated(xml) do
    updated = xml
    |> Floki.find("updated")

    if updated == [] do
      nil
    else
      updated |> hd |> extract_last_item
    end
  end

  defp parse_form_name(xml) do
    form_name = xml
    |> Floki.find("form-name")

    if form_name == [] do
      nil
    else
      form_name |> hd |> extract_last_item
    end
  end

  defp parse_title(xml) do
    title = xml
    |> Floki.find("title")

    if title == [] do
      nil
    else
      title |> hd |> extract_last_item
    end
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
    rss_feed_id = xml
    |> Floki.find("id")

    if rss_feed_id == [] do
      nil
    else
      rss_feed_id |> hd |> extract_last_item
    end
  end

  defp parse_size(xml) do
    {_, _, size} = xml
    |> Floki.find("size")
    |> hd
    size
    |> hd
  end

  defp parse_film_number(xml) do
    film_number = xml
    |> Floki.find("film-number")

    if film_number == [] do
      nil
    else
      film_number |> hd |> extract_last_item
    end
  end

  defp parse_filing_type(xml) do
    filing_type = xml
    |> Floki.find("filing-type")

    if filing_type == [] do
      nil
    else
      filing_type |> hd |> extract_last_item
    end
  end

  defp parse_filing_date(xml) do
    filing_date = xml
    |> Floki.find("filing-date")

    if filing_date == [] do
      nil
    else
      filing_date |> hd |> extract_last_item
    end
  end

  defp parse_file_name_href(xml) do
    file_name = xml
    |> Floki.find("file-number-href")

    if file_name == [] do
      nil
    else
      file_name |> hd |> extract_last_item
    end
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
    accession_nunber = xml
    |> Floki.find("accession-nunber")

    if accession_nunber == [] do
      nil
    else
      accession_nunber |> hd |> extract_last_item
    end
  end

  defp parse_act(xml) do
    act = xml
    |> Floki.find("act")

    if act == [] do
      nil
    else
      act |> hd |> extract_last_item
    end
  end

  defp parse_file_number(xml) do
    file_number = xml
    |> Floki.find("file-number")

    if file_number == [] do
      nil
    else
      file_number |> hd |> extract_last_item
    end
  end
end
