defmodule ExUbx.CLI.Command.Help do

    use ExUbx.CLI.Command

    @shortdoc "Show this help message"

    def run(_, _) do
        IO.puts "ExUbx Version #{ExUbx.version}\n"
        IO.puts "Usage: mix ubx <command> [options]\n"
        IO.puts "Commands:\n"

        ExUbx.CLI.commands
            |> Enum.each(fn(name) ->
                    module  = name |> ExUbx.CLI.call_command
                    command = name |> to_string |> String.pad_trailing(12)

                    case List.keyfind(module.__info__(:attributes), :shortdoc, 0) do
                        { :shortdoc, [description] } ->
                            IO.puts "  #{command} #{description}"
                        _ ->
                            IO.puts "  #{command} Unknow"
                    end
               end)

        IO.puts "\nUse `--help` to get more information on any command\n"

        IO.puts ~s(For example, "mix ubx list --help" to help on the list command.)

        :ok
    end

end
