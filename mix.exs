defmodule ExUbx.Mixfile do

    use Mix.Project

    def project do
        [
            app: :exubx,
            version: "0.2.0",
            elixir: "~> 1.6",
            build_embedded: Mix.env == :prod,
            start_permanent: Mix.env == :prod,
            deps: deps(),
            package: package(),
            description: "A fetch tool for listing the remote ubx performance list.",

            name: "ExUbx",
            source_url: "https://github.com/zeuxisoo/elixir-exubx",
            homepage_url: "https://github.com/zeuxisoo/elixir-exubx",
            docs: [
                main: "ExUbx",
                extras: ["README.md"]
            ]
        ]
    end

    # Configuration for the OTP application
    #
    # Type "mix help compile.app" for more information
    def application do
        [
            applications: [:logger, :httpotion],
        ]
    end

    # Dependencies can be Hex packages:
    #
    #   {:mydep, "~> 0.3.0"}
    #
    # Or git/path repositories:
    #
    #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
    #
    # Type "mix help deps" for more examples and options
    defp deps do
        [
            { :httpotion, "~> 3.1" },
            { :poison, "~> 4.0" },
            { :ex_doc, "~> 0.19.3" },
        ]
    end

    defp package do
        [
            name: :exubx,
            files: ["lib", "mix.exs", "README*"],
            maintainers: ["Zeuxis Lo"],
            licenses: ["MIT"],
            links: %{"GitHub" => "https://github.com/zeuxisoo/elixir-exubx"},
        ]
    end

end
