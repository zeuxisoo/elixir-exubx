defmodule ExUbx.CLI.Command.List do

    def run(_, kwargs) do
        if Enum.empty?(kwargs) === true || Keyword.has_key?(kwargs, :event) === false do
            print_help
        else
            event_id = kwargs[:event]

            # TODO: list all related events by event id
        end

        :ok
    end

    defp print_help do
        IO.puts """
        Usage: mix ubx list [options]

        List events from remote performance json file.

        Example:

            mix ubx list --event=12345
            mix ubx list -e 12345

        List options:

            -e, --event         Show all related events
        """
    end

end
