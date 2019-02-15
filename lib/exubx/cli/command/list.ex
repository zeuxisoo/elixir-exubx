defmodule ExUbx.CLI.Command.List do

    alias ExUbx.Validator

    def run(_, kwargs) do
        if Enum.empty?(kwargs) === true || Keyword.has_key?(kwargs, :event) === false do
            print_help()
        else
            HTTPotion.start

            auth = ExUbx.fetch_auth

            if Validator.has_auth_token?(auth) === false do
                { :error, "Cannot got valid auth token" }
            else
                event_id    = kwargs[:event]
                performance = ExUbx.fetch_performance(auth.cookie, event_id)

                if Validator.has_performances?(performance) === false do
                    { :error, "Cannot got the performance file" }
                else
                    performances = ExUbx.convert_performances(performance)

                    for performance <- performances do
                        name   = performance["performanceName"]
                        date   = performance["performanceDateTime"] |> div(1000) |> DateTime.from_unix! |> DateTime.to_string
                        status = performance["status"]

                        IO.puts "#{name} - #{date} => #{status}"
                    end

                    :ok
                end
            end
        end
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

        :ok
    end

end
