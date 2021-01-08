# DealerAnomaly

A personal project/thought experiment. The goal is to take an existing website for
a product (in this case A car dealership's reviews) and try to determine which
reviews were created by an individual (or group) to artificially boost the reviews
of said product.

## Positivity Criteria

The most positive reviews are sorted according to

```
review recommends dealership
number of stars in detailed breakdown
higher number of employees on the review is more positive
```

Other possible criteria

```
spelling/grammar mistakes in review comment
percent of buzzwords in review comment
```

## How to run

Make sure Elixir is installed

> Installation instructions: https://elixir-lang.org/install.html

Clone repository to local machine

Go to local repository directory

Install dependencies

```
mix deps.get
```

Run tests

```
mix test
```

Open interactive elixir

```
iex -S mix
```

See top 3 offenders by running

```
DealerAnomaly.work()
```
