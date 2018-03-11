defmodule Scaleway.MixProject do
  use Mix.Project

  def project do
    [
      app: :scaleway,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: Coverex.Task],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, :poison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:coverex, "~> 1.4.10", only: :test},
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
