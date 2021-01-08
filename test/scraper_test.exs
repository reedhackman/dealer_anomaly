defmodule DealerAnomaly.ScraperTest do
  use ExUnit.Case
  alias DealerAnomaly.Scraper
  import Mox

  @http_client DealerAnomaly.HTTPClientMock

  @mocked_html """
  <html>
  <head>
  <title>Test</title>
  </head>
  <body>
    <a href="http://foo.com/blah?hi=blah&foo=&#43;Park" class="foo">test</a>
    <div class="content">
      <a href="http://google.com" class="js-google js-cool">Google</a>
      <a href="http://elixir-lang.org" class="js-elixir js-cool">Elixir lang</a>
      <a href="http://java.com" class="js-java">Java</a>
    </div>
    <div class="review-entry">
      <p>This is a test</p>
    </div>
    <div class="review-entry">
      <p>This is a different test</p>
    </div>
  </body>
  </html>
  """

  @parsed_mocked_html [
    {"html", [],
     [
       {"head", [], [{"title", [], ["Test"]}]},
       {"body", [],
        [
          {"a", [{"href", "http://foo.com/blah?hi=blah&foo=+Park"}, {"class", "foo"}], ["test"]},
          {"div", [{"class", "content"}],
           [
             {"a", [{"href", "http://google.com"}, {"class", "js-google js-cool"}], ["Google"]},
             {"a", [{"href", "http://elixir-lang.org"}, {"class", "js-elixir js-cool"}],
              ["Elixir lang"]},
             {"a", [{"href", "http://java.com"}, {"class", "js-java"}], ["Java"]}
           ]},
          {"div", [{"class", "review-entry"}], [{"p", [], ["This is a test"]}]},
          {"div", [{"class", "review-entry"}], [{"p", [], ["This is a different test"]}]}
        ]}
     ]}
  ]

  describe "get_body/1" do
    test "returns body if request succeeds" do
      expect(@http_client, :get, fn "goodurl.biz" ->
        {:ok, %HTTPoison.Response{status_code: 200, body: @mocked_html}}
      end)

      assert @mocked_html = Scraper.get_body("goodurl.biz", @http_client)
    end

    test "returns error if request fails" do
      expect(@http_client, :get, fn "badurl.biz" ->
        {:error, %HTTPoison.Error{}}
      end)

      assert %HTTPoison.Error{} = Scraper.get_body("badurl.biz", @http_client)
    end
  end

  describe "extract_reviews/1" do
    test "correctly grabs only the reviews" do
      assert [
               {"div", [{"class", "review-entry"}], [{"p", [], ["This is a test"]}]},
               {"div", [{"class", "review-entry"}], [{"p", [], ["This is a different test"]}]}
             ] =
               Scraper.extract_reviews(@parsed_mocked_html)
    end
  end
end
