defmodule DealerAnomaly do
  @moduledoc """
  Documentation for `DealerAnomaly`.
  """

  alias DealerAnomaly.Scraper
  alias DealerAnomaly.ConvertReview

  @urls [
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685",
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page2",
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page3",
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page4",
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page5"
  ]

  @doc """
  The function that accomplishes our task. It gets the HTML for the pages corresponding
  to each of the URLs above, extracts the reviews section from each page, parses
  the HTML for our desired data, and then sorts it in order of review positivity.
  Because we only want the 3 best reviews, it onlyction from each page, parses
  the HTML for our desired data, and then sorts it in order of review positivity.
  Because we only want the 3 best reviews, it only returns the first 3 elements of
  the sorted list.
  """
  def work do
    parsed_reviews =
      Enum.reduce(@urls, [], fn url, all_reviews ->
        page_of_reviews = Scraper.scrape_reviews(url)
        all_reviews ++ page_of_reviews
      end)

    converted_reviews =
      Enum.map(parsed_reviews, fn review_html ->
        ConvertReview.from_html(review_html)
      end)

    sorted_reviews = sort_reviews(converted_reviews)

    Enum.take(sorted_reviews, 3)
  end

  @doc """
  sort_reviews takes the list of reviews and ranks them according to their average
  numerical score, followed by the number of employees that are associated with
  the (probably) perfect score.
  """
  def sort_reviews(reviews) do
    reviews
    |> Enum.sort_by(
      &{&1.recommend_dealer === "Yes", &1.ratings.average, length(&1.employees)},
      :desc
    )
  end
end
