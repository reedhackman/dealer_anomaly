defmodule DealerAnomalyTest do
  use ExUnit.Case
  alias DealerAnomaly

  describe "sort_reviews/1" do
    @review_one %{
      comments:
        "Adrian was extremely helpful in selecting my new Buick. He was very courteous and understand with all of the question i had asked. For sure will come back for my next vehicle. ",
      date_written: "December 11, 2020",
      employees: ["Adrian \"AyyDee\" Cortes"],
      ratings: %{
        average: 5.0,
        customer_service: 5.0,
        friendliness: 5.0,
        overall_experience: 5.0,
        price: 5.0,
        quality: 5.0
      },
      recommend_dealer: "Yes",
      username: "Katherinetisdale"
    }

    @review_two %{
      comments:
        "Fast and friendly service, Dennis was very helpful and explained everything about the car that I needed to know. Would highly recommend McKaig Chev Buick to friends and family.\r\nRenee M",
      date_written: "December 15, 2020",
      employees: ["Taylor Prickett", "Dennis Smith"],
      ratings: %{
        average: 3.0,
        customer_service: 5.0,
        friendliness: 5.0,
        overall_experience: 0.0,
        price: 5.0,
        quality: 0.0
      },
      recommend_dealer: "Yes",
      username: "renee9173"
    }

    @review_three %{
      comments:
        "David Varner really worker hard over a couple of days to help my future husband get a brand new Chevy equinox thank you so much David ",
      date_written: "December 17, 2020",
      employees: ["Freddie Tomlinson", "David Varner", "Brandon McCloskey"],
      ratings: %{
        average: 5.0,
        customer_service: 5.0,
        friendliness: 5.0,
        overall_experience: 5.0,
        price: 5.0,
        quality: 5.0
      },
      recommend_dealer: "Yes",
      username: "Stephanie.veaseyste "
    }

    test("correctly sorts the reviews") do
      reviews_list = [@review_one, @review_two, @review_three]
      sorted_reviews = DealerAnomaly.sort_reviews(reviews_list)

      assert sorted_reviews == [@review_three, @review_one, @review_two]
    end
  end
end
