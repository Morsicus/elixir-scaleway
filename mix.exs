defmodule Scaleway.MixProject do
  use Mix.Project

  def project do
    [
      app: :scaleway,
      version: "0.1.6",
      elixir: "~> 1.6",
      description: "An Elixir wrapper for the Scaleway API",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: Coverex.Task],
      deps: deps(),
      package: package(),

      # Docs
      name: "Elixir-Scaleway",
      source_url: "https://github.com/Morsicus/elixir-scaleway",
      homepage_url: "https://github.com/Morsicus/elixir-scaleway",
      docs: [
        main: "Scaleway",
        extras: ["README.md"]
      ]
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
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:coverex, "~> 1.4.10", only: :test},
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do [
    name: :scaleway,
    maintainers: ["Mickaël Fortunato"],
    licenses: ["Beerware"],
    links: %{"Github" => "https://github.com/Morsicus/elixir-scaleway"}
  ] end
end
