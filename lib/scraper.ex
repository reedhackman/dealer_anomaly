defmodule DealerAnomaly.Scraper do
  @moduledoc """
  Module for extracting the reviews from a DealerRater.com dealership page
  """

  def scrape_reviews(url) do
    url
    |> get_body()
    |> parse_html()
    |> extract_reviews()
  end

  def extract_reviews(html) do
    Floki.find(html, ".review-entry")
  end

  def parse_html(body) do
    {:ok, parsed_html} = Floki.parse_document(body)
    parsed_html
  end

  @doc """
  This is a lot more "hackey" than I would like, configured in such a way to make
  this mockable for testing purposes
  """
  def get_body(url, http_client \\ default_client()) do
    case http_client.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 301}} ->
        handle_redirect(url)

      {:error, error} ->
        error
    end
  end

  def handle_redirect(url) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} =
      HTTPoison.get(url, [], follow_redirect: true)

    body
  end

  defp default_client do
    Application.get_env(:dealer_anomaly, :scraper) |> Keyword.get(:http_client)
  end
end
