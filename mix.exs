defmodule MasMensajes.Mixfile do
  use Mix.Project

  @preferred_cli_env [
    coveralls: :test,
    "coveralls.detail": :test,
    "coveralls.html": :test,
    "coveralls.json": :test,
    vcr: :test,
    "vcr.delete": :test,
    "vcr.check": :test,
    "vcr.show": :test
  ]

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env() == :prod

    [
      app: :mas_mensajes,
      version: "0.1.2",
      elixir: ">= 1.9.2",
      deps: deps(),
      aliases: aliases(),
      build_embedded: in_production,
      preferred_cli_env: @preferred_cli_env,
      test_coverage: [tool: ExCoveralls],
      description: "Mas Mensajes client.",
      package: package(),
      name: "Mas Mensajes client",
      source_url: "https://github.com/paridin/mas_mensajes_client",
      homepage_url: "https://paridin.com",
      docs: [
        # The main page in the docs
        main: "MasMensajes",
        # logo: "logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  defp aliases do
    []
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{}
    ]
  end

  defp deps() do
    [
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.7"},
      # devel & testing
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:excoveralls, "~> 0.13", only: :test},
      {:exvcr, "~> 0.11", only: [:dev, :test]},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  def application do
    [
      mod: {MasMensajes.Application, []},
      extra_applications: [
        :logger
      ]
    ]
  end
end
