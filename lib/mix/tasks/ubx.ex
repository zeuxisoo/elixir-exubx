defmodule Mix.Tasks.Ubx do

    use Mix.Task

    @shortdoc "Quicky find out event status"
    @moduledoc @shortdoc

    def run(argv) do
        ExUbx.CLI.main(argv)
    end

end
