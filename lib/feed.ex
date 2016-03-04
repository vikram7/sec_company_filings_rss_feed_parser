defmodule SecCompanyFilingsRssFeedParser.Feed do

  def parse(xml) do
    %{
      updated: parse_updated(xml),
      title: parse_title(xml),
      author_name: parse_author_name(xml),
      author_email: parse_author_email(xml),
      entries: parse_feed(xml)
    }
  end

  def extract_last_item(tuple) do
    {_, _, item} = tuple
    item |> hd
  end

  defp parse_feed(xml) do
  end

  defp parse_updated(feed) do
    {_, _, date} = feed 
    |> Floki.find("updated") 
    |> tl
    |> tl
    |> hd
    date |> hd
  end

  defp parse_title(feed) do
    feed
    |> Floki.find("title")
    |> hd
    |> extract_last_item
  end

  defp parse_author_name(feed) do
    feed |> Floki.find("author name") |> hd
    |> extract_last_item
  end

  defp parse_author_email(feed) do
    feed |> Floki.find("author email") |> hd
    |> extract_last_item
  end
end
