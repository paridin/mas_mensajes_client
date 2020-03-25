defmodule MasMensajes.Mixfile do
  use Mix.Project

  @name :mas_mensajes
  @version "0.1.1"

  @deps [
    {:jason, "~> 1.1"},
    {:httpoison, "~> 1.6"},
    {:fn_expr, "~> 0.2"},
    {:version_tasks, "~> 0.10"},
    {:ex_doc, ">= 0.0.0", only: :dev},
    # dev & test deps
    {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
    {:excoveralls, "~> 0.11", only: :test},
    {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
    {:exvcr, "~> 0.10", only: [:dev, :test]}
  ]

  @aliases []

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
      app: @name,
      version: @version,
      elixir: ">= 1.9.2",
      deps: @deps,
      aliases: @aliases,
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

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{}
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
