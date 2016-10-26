defmodule ExUbx.CLI do

    @switches [
        event: :integer
    ]

    @aliases [
        e: :event
    ]

    @commands %{
        "help" => ExUbx.CLI.Command.Help,
        "version" => ExUbx.CLI.Command.Version,
    }

    def main(argv) do
        argv
            |> parse_options
            |> handle_exit
    end

    def parse_options(argv) do
        # Kwargs, args, error
        { kwargs, args, [] } = OptionParser.parse(argv, switches: @switches, aliases: @aliases)

        # Syntax "mix ubx command"
        { command, args } = case args |> List.first |> call_command() do
            nil ->
                { nil, args }
            command ->
                { command, args |> Enum.slice(1..-1) }
        end

        if command != nil do
            command.run(args, kwargs)
        else
            ExUbx.CLI.Command.Help.run(args, kwargs)
        end
    end

    def call_command(nil), do: nil
    def call_command(command) do
        commands = Map.keys(@commands)

        if Enum.member?(commands, command) do
            @commands[command]
        else
            nil
        end
    end

    defp handle_exit(:ok), do: nil
    defp handle_exit({ :error, message }) do
        IO.puts message

        System.halt 1
    end

end
