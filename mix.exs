defmodule Doggie.Mixfile do
  use Mix.Project

  def project do
    [app: :doggie,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     source_url: "https://github.com/lk-geimfari/doggie",
     description: "Doggie is a tiny library that provides the most commonly used
     regular expression patterns for Elixir.",
     package: package(),
     docs: [extras: ["README.md"]]
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    Doggie is a tiny library that provides the most commonly used regular expression patterns.
    """
  end

  defp package do
    [
    name: :doggie,
    files: ["lib/", "mix.exs", "README*", "LICENSE*"],
    maintainers: ["Likid Geimfari"],
    licenses: ["MIT Licenses"],
    links: %{"GitHub" => "https://github.com/lk-geimfari/doggie"}
  ]
  end
end
