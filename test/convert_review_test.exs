defmodule DealerAnomaly.ConvertReviewTest do
  use ExUnit.Case
  alias DealerAnomaly.ConvertReview

  @parsed_html [
    {"div",
     [
       {"class", "review-entry col-xs-12 text-left pad-none pad-top-lg border-bottom-teal-lt"}
     ],
     [
       {"div",
        [
          {"class", "col-xs-12 col-sm-3 pad-left-none text-center review-date margin-bottom-md"}
        ],
        [
          {"div", [{"class", "italic col-xs-6 col-sm-12 pad-none margin-none font-20"}],
           ["\n      January 04, 2021\n    "]},
          {"div", [{"class", "col-xs-6 col-sm-12 pad-none dealership-rating"}],
           [
             {"div",
              [
                {"class", "rating-static visible-xs pad-none margin-none rating-50 pull-right"}
              ], []},
             {"div", [{"class", "rating-static hidden-xs rating-50 margin-center"}], []},
             {"div",
              [
                {"class", "col-xs-12 hidden-xs pad-none margin-top-sm small-text dr-grey"}
              ], ["\n        SALES VISIT - USED\n      "]}
           ]}
        ]},
       {"div", [{"class", "col-xs-12 col-sm-9 pad-none review-wrapper"}],
        [
          {:comment, " REVIEW TITLE, USER"},
          {"div", [{"class", "margin-bottom-sm line-height-150"}],
           [
             {"h3", [{"class", "no-format inline italic-bolder font-20 dark-grey"}],
              [
                "\n        \"Started my process online, then came into the dealership...\"\n      "
              ]},
             {"span", [{"class", "italic font-18 black notranslate"}], ["- Shayla C"]}
           ]},
          {:comment, " REVIEW BODY "},
          {"div", [{"class", "tr margin-top-md"}],
           [
             {"div", [{"class", "td text-left pad-right-lg pad-top-sm"}],
              [
                {"img",
                 [
                   {"class", "margin-bottom-md pointer"},
                   {"id", "lotshotPhoto_2012524"},
                   {"onclick", "ShowLotshotImage(this);"},
                   {"src",
                    "https://cdn-user.dealerrater.com/images/lotshot/b684dda7-1dc8-439b-810f-6aeecc15804f-th.jpg"},
                   {"width", "142px"}
                 ], []}
              ]},
             {"div", [{"class", "td text-left valign-top"}],
              [
                {"p",
                 [
                   {"class", "font-16 review-content margin-bottom-none line-height-25"}
                 ],
                 [
                   "\n          Started my process online, then came into the dealership to finish up\n          everything and drove off in my new Malibu! We spent only a few hours\n          at the dealership, but the people were so friendly it didn’t seem like\n          that long. Shonna was AMAZING!!!!!!\n        "
                 ]},
                {"a",
                 [
                   {"id", "7745345"},
                   {"class",
                    "read-more-toggle pointer line-height-25 small-text block margin-bottom-md"}
                 ], ["Read More"]}
              ]}
           ]},
          {:comment, " REVIEW RATINGS - ALL "},
          {"div",
           [
             {"class",
              "pull-left pad-left-md pad-right-md bg-grey-lt margin-bottom-md review-ratings-all review-hide"}
           ],
           [
             {:comment, " REVIEW RATING - CUSTOMER SERVICE "},
             {"div",
              [
                {"class", "table width-100 pad-left-none pad-right-none margin-bottom-md"}
              ],
              [
                {"div", [{"class", "tr"}],
                 [
                   {"div", [{"class", "lt-grey small-text td"}], ["Customer Service"]},
                   {"div", [{"class", "rating-static-indv rating-50 margin-top-none td"}], []}
                 ]},
                {:comment, " REVIEW RATING - QUALITY OF WORK "},
                {"div", [{"class", "tr margin-bottom-md"}],
                 [
                   {"div", [{"class", "lt-grey small-text td"}], ["Quality of Work"]},
                   {"div", [{"class", "rating-static-indv rating-50 margin-top-none td"}], []}
                 ]},
                {:comment, " REVIEW RATING - FRIENDLINESS "},
                {"div", [{"class", "tr margin-bottom-md"}],
                 [
                   {"div", [{"class", "lt-grey small-text td"}], ["Friendliness"]},
                   {"div", [{"class", "rating-static-indv rating-50 margin-top-none td"}], []}
                 ]},
                {:comment, " REVIEW RATING - PRICING "},
                {"div", [{"class", "tr margin-bottom-md"}],
                 [
                   {"div", [{"class", "lt-grey small-text td"}], ["Pricing"]},
                   {"div", [{"class", "rating-static-indv rating-50 margin-top-none td"}], []}
                 ]},
                {:comment, " REVIEW RATING - EXPERIENCE "},
                {"div", [{"class", "tr margin-bottom-md"}],
                 [
                   {"div", [{"class", "td lt-grey small-text"}], ["Overall Experience"]},
                   {"div", [{"class", "rating-static-indv rating-50 margin-top-none td"}], []}
                 ]},
                {:comment, " REVIEW RATING - RECOMMEND DEALER "},
                {"div", [{"class", "tr"}],
                 [
                   {"div", [{"class", "lt-grey small-text td"}], ["Recommend Dealer"]},
                   {"div", [{"class", "td small-text boldest"}],
                    ["\n            Yes\n          "]}
                 ]}
              ]}
           ]},
          {:comment, " EMPLOYEE SECTION "},
          {"div", [{"class", "clear-fix margin-top-sm"}],
           [
             {"div", [{"class", "col-xs-12 lt-grey pad-left-none employees-wrapper"}],
              [
                {"div", [{"class", "small-text"}], ["Employees Worked With"]},
                {"div",
                 [
                   {"class",
                    "col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee"}
                 ],
                 [
                   {"div", [{"class", "table"}],
                    [
                      {"div",
                       [
                         {"class", "td square-image employee-image"},
                         {"style",
                          "\n                background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/ca22768af3f7.jpg);\n              "}
                       ], []},
                      {"div",
                       [
                         {"class", "td valign-bottom pad-left-md pad-top-none pad-bottom-none"}
                       ],
                       [
                         {"a",
                          [
                            {"class",
                             "notranslate pull-left line-height-1 tagged-emp small-text teal margin-right-sm emp-640356"},
                            {"data-emp-id", "640356"},
                            {"href", "/sales/Taylor-Prickett-review-640356/"}
                          ], ["\n                Taylor Prickett\n              "]},
                         {"div", [{"class", "col-xs-12 pad-none margin-none pad-top-sm"}], []}
                       ]}
                    ]}
                 ]},
                {"div",
                 [
                   {"class",
                    "col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee"}
                 ],
                 [
                   {"div", [{"class", "table"}],
                    [
                      {"div",
                       [
                         {"class", "td square-image employee-image"},
                         {"style",
                          "\n                background-image: url(https://cdn-user.dealerrater.com/images/dealer/23685/employees/f7039892a18c.jpg);\n              "}
                       ], []},
                      {"div",
                       [
                         {"class", "td valign-bottom pad-left-md pad-top-none pad-bottom-none"}
                       ],
                       [
                         {"a",
                          [
                            {"class",
                             "notranslate pull-left line-height-1 tagged-emp small-text teal margin-right-sm emp-664900"},
                            {"data-emp-id", "664900"},
                            {"href", "/sales/Shonna-Stuve-review-664900/"}
                          ], ["\n                Shonna Stuve\n              "]},
                         {"div", [{"class", "col-xs-12 pad-none margin-none pad-top-sm"}], []}
                       ]}
                    ]}
                 ]},
                {"div",
                 [
                   {"class",
                    "col-xs-12 col-sm-6 col-md-4 pad-left-none pad-top-sm pad-bottom-sm review-employee"}
                 ],
                 [
                   {"div", [{"class", "table"}],
                    [
                      {"div",
                       [
                         {"class", "td square-image employee-image"},
                         {"style",
                          "\n                background-image: url(https://cdn-user.dealerrater.com/images/employee-placeholder.jpg);\n              "}
                       ], []},
                      {"div",
                       [
                         {"class", "td valign-bottom pad-left-md pad-top-none pad-bottom-none"}
                       ],
                       [
                         {"a",
                          [
                            {"class",
                             "notranslate pull-left line-height-1 tagged-emp small-text teal emp-665485"},
                            {"data-emp-id", "665485"},
                            {"href", "/sales/Brook-Davis-review-665485/"}
                          ], ["\n                Brook Davis\n              "]},
                         {"div", [{"class", "col-xs-12 pad-none margin-none pad-top-sm"}], []}
                       ]}
                    ]}
                 ]}
              ]}
           ]},
          {:comment, " SOCIAL MEDIA AND REVIEW ACTIONS "},
          {"div", [{"class", "col-xs-12 pad-none review-hide margin-top-lg"}],
           [
             {"div", [{"class", "pull-left"}],
              [
                {"a",
                 [
                   {"href",
                    "https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/7745345&via=dealerrater&text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People"},
                   {"onclick",
                    "window.open('https://twitter.com/intent/tweet?url=http://www.dealerrater.com/consumer/social/7745345&via=dealerrater&text=Check+out+the+latest+review+on+McKaig+Chevrolet+Buick+-+A+Dealer+For+The+People', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"},
                   {"target", "_blank"},
                   {"rel", "nofollow"},
                   {"title", "Twitter"}
                 ],
                 [
                   {"img",
                    [
                      {"class", "align-bottom"},
                      {"height", "20"},
                      {"src",
                       "https://www.dealerrater.com/ncdn/s/183.20210104.1/Graphics/icons/icon_twitter_sm.png"}
                    ], []}
                 ]},
                {"a",
                 [
                   {"href",
                    "http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/7745345"},
                   {"onclick",
                    "window.open('http://www.facebook.com/share.php?u=http://www.dealerrater.com/consumer/social/7745345', 'sharer', 'toolbar=0,status=0,width=750,height=500');return false;"},
                   {"target", "_blank"},
                   {"rel", "nofollow"},
                   {"title", "Facebook"}
                 ],
                 [
                   {"img",
                    [
                      {"class", "align-bottom"},
                      {"height", "20"},
                      {"src",
                       "https://www.dealerrater.com/ncdn/s/183.20210104.1/Graphics/icons/icon_facebook_sm.png"}
                    ], []}
                 ]}
              ]},
             {"div", [{"class", "pull-left margin-left-md"}],
              [
                {"a",
                 [
                   {"href", "#"},
                   {"onclick", "javascript:window.reportReview(7745345); return false;"},
                   {"class", "small-text"}
                 ], ["Report"]},
                "\n        |\n        ",
                {"a",
                 [
                   {"href", "#"},
                   {"onclick",
                    "window.open('/consumer/dealer/23685/review/7745345/print', 'report', 'toolbar=no,scrollbars=yes,location=no,width=720,height=400,resizable=yes'); return false;"},
                   {"class", "small-text"}
                 ], ["Print"]}
              ]}
           ]},
          {:comment, " PUBLIC MESSAGES "},
          {:comment, " WAS HELPFUL SECTION "},
          {"div", [{"class", "col-xs-12 margin-bottom-lg"}],
           [
             {"div", [{"class", "pull-right"}],
              [
                {"a",
                 [
                   {"href", "#"},
                   {"class", "helpful-button"},
                   {"onclick", "javascript:MarkReviewHelpful(7745345, this); return false;"}
                 ],
                 [
                   {"img",
                    [
                      {"class", "pull-left margin-right-sm"},
                      {"src",
                       "https://www.dealerrater.com/ncdn/s/183.20210104.1/Graphics/icons/icon-thumbsup.png"}
                    ], []},
                   "\n          Helpful\n          ",
                   {"span",
                    [
                      {"class", "helpful-count display-none"},
                      {"id", "helpful_count_7745345"}
                    ], ["0"]}
                 ]}
              ]}
           ]}
        ]}
     ]}
  ]

  describe "from_html/1" do
    test "returns converted html" do
      assert %{
               comments:
                 "\n          Started my process online, then came into the dealership to finish up\n          everything and drove off in my new Malibu! We spent only a few hours\n          at the dealership, but the people were so friendly it didn’t seem like\n          that long. Shonna was AMAZING!!!!!!\n        ",
               date_written: "\n      January 04, 2021\n    ",
               employees: ["Taylor Prickett", "Shonna Stuve", "Brook Davis"],
               ratings: %{
                 average: 5.0,
                 customer_service: 5.0,
                 friendliness: 5.0,
                 overall_experience: 5.0,
                 price: 5.0,
                 quality: 5.0
               },
               recommend_dealer: "Yes",
               username: "Shayla C"
             } = ConvertReview.from_html(@parsed_html)
    end
  end
end
