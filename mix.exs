defmodule BB.MixProject do
  use Mix.Project

  def project do
    [
      app: :bb,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BB.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:barlix, "~> 0.6.0"},
      {:slack, "~> 0.20.0"},
    ]
  end
end
