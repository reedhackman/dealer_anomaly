# DealerAnomaly

A personal project/thought experiment. The goal is to take an existing website for
a product (in this case A car dealership's reviews) and try to determine which
reviews were created by an individual (or group) to artificially boost the reviews
of said product.

This project assumes that the most overly positive endorsement of the car dealership
is one that recommends the dealer, gives 5/5 stars for each of the five rating
categories, and includes as many people employees of the dealership as possible.
The justification for this is that it will bring up the average score for each of the
rating categories, thus making the user more likely to select said dealership when
deciding where to shop. Because most of the reviews give full stars across categories,
we need and additional field to sort by, and each employee that is interacted with in
the review adds credibility to the quality of the dealership. Additionally, this
project was done at the beginning of 2021, when the United States is in the middle
of the COVID-19 pandemic and people are incentivized to interact with as few people
as possible, further adding suspicion to reviews from this time period with many
interactions.

Another strategy for finding fake reviews would be searching the review text for
grammar/spelling mistakes instead of filtering by number of employees that a reviewer
interacted with, but I know too many people with poor grammar to trust in that reasoning.
A better method for going down the text-parsing route would be cross referencing the
review comments with a list of buzzwords and figuring out which reviews were proportionally
too high in the buzzwords, but we're assuming that people don't care as much about
review content as they do scores of dealerships or their employees.

## How to run

Elixir and Erlang must be installed. I'm omitting the installation instructions since
the reader of this most likely already has it installed on their machine if they're
checking out an Elixir project :)

1. Clone repository to local machine
2. Go to local repository directory
3. Install dependencies by running `mix deps.get`
4. Run tests to verify program integrity by running `mix test`
5. Open interactive elixir by running `iex -S mix`
6. See top 3 offenders by running `DealerAnomaly.work()`
