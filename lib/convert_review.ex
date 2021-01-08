defmodule DealerAnomaly.ConvertReview do
  @moduledoc """
  Module to take parsed HTML and convert it to a Map for easier analysis. Our
  desired Map will follow the structure seen on the reviews list seen at
  http://api.dealerrater.com/docs/, with unnecessary fields ommitted. Using the
  library Floki, we can determine the best way to extract the desired fields by
  inspecting the web page and isolating the appropriate attribute(s) that
  correspond to the data we want.
  """

  @doc """
  exposed function that takes parsed HTML and extracts the desired fields, then
  uses said data to construct reviews' Map
  """
  def from_html(html) do
    comments = parse_comments(html)
    username = parse_username(html)
    date_written = parse_date(html)
    employees = parse_employees(html)
    recommend_dealer = parse_recommend_dealer(html)
    ratings = parse_ratings(html)

    %{
      comments: comments,
      username: username,
      date_written: date_written,
      employees: employees,
      recommend_dealer: recommend_dealer,
      ratings: ratings
    }
  end

  defp parse_comments(html) do
    html
    |> Floki.find(".review-content")
    |> Floki.text()
  end

  defp parse_date(html) do
    html
    |> Floki.find(".review-date")
    |> Floki.find(".italic")
    |> Floki.text()
  end

  defp parse_employees(html) do
    html
    |> Floki.find(".employees-wrapper")
    |> Floki.find("a")
    |> Enum.map(fn employee ->
      employee
      |> Floki.text()
      |> String.trim()
    end)
  end

  # DealerRater uses CSS class names to display how many stars each rating category
  # recieves from the reviewer. Because of this, we need to isolate the appropriate
  # field and then parse the location of the numeric value from it. In the CSS, the
  # star score is represented between 00 - 50, and our desired format is a Float
  # in the range of 0 - 5, so we need to convert and then divide the CSS rating by 10.
  # Additionally, we compute the average of these ratings for sorting purposes.
  # It's worth noting that we COULD determine said average by looking at the overall
  # stars on the review, but there are several reviews where the user didn't assign
  # any rating for some of the categories (i.e. gave 5 stars to overall experience
  # and didn't assign stars to quality, but still displayed as 5), so doing the
  # additional step of averaging it outselves will help filter out the "incomplete"
  # reviews.
  defp parse_ratings(html) do
    [
      {"div", [{"class", customer_service_css_class}], []},
      {"div", [{"class", quality_css_class}], []},
      {"div", [{"class", friendliness_css_class}], []},
      {"div", [{"class", overall_experience_css_class}], []},
      {"div", [{"class", price_css_class}], []}
    ] =
      html
      |> Floki.find(".review-ratings-all")
      |> Floki.find(".rating-static-indv")

    {customer_service, _} = customer_service_css_class |> String.slice(26, 2) |> Float.parse()
    {quality, _} = quality_css_class |> String.slice(26, 2) |> Float.parse()
    {friendliness, _} = friendliness_css_class |> String.slice(26, 2) |> Float.parse()
    {overall_experience, _} = overall_experience_css_class |> String.slice(26, 2) |> Float.parse()
    {price, _} = price_css_class |> String.slice(26, 2) |> Float.parse()

    %{
      customer_service: customer_service / 10,
      quality: quality / 10,
      friendliness: friendliness / 10,
      overall_experience: overall_experience / 10,
      price: price / 10,
      average: (customer_service + quality + friendliness + overall_experience + price) / 50
    }
  end

  defp parse_recommend_dealer(html) do
    html
    |> Floki.find(".review-ratings-all")
    |> Floki.find(".boldest")
    |> Floki.text()
    |> String.trim()
  end

  defp parse_username(html) do
    html
    |> Floki.find(".review-wrapper")
    |> Floki.find(".italic")
    |> List.first()
    |> Floki.text()
    |> String.slice(2..-1)
  end
end
