defmodule PlugExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Example, []},
      env: [cowboy_port: 8080]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4.0"},
      {:plug, "~> 1.6.3"}
    ]
  end
end
