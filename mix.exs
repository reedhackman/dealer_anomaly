defmodule DealerAnomaly.MixProject do
  use Mix.Project

  def project do
    [
      app: :dealer_anomaly,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:floki, "~> 0.29.0"},
      {:mox, "~> 1.0", only: :test}
    ]
  end
end
