defmodule ExUbx.CLI.Command.Version do

    def run(_, _) do
        IO.puts ExUbx.version

        :ok
    end

end
