defmodule ExUbx.CLI.Command.Version do

    use ExUbx.CLI.Command

    @shortdoc "Show current version"

    def run(_, _) do
        IO.puts ExUbx.version

        :ok
    end

end
