defmodule SecCompanyFilingsRssFeedParser do
  @moduledoc """
  This module generates what the library returns or
  handles errors if there are issues generating it
  """

  def parse(xml) do
    {:ok, SecCompanyFilingsRssFeedParser.Feed.parse(xml)}
  catch
    :exit, _ -> {:error, "expected element start tag"}
  end

  def parse!(xml) do
    case parse(xml) do
      {:ok, feed} -> feed
      {:error, error} -> raise error
    end
  end
end
