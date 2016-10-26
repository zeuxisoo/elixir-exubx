defmodule ExUbx do

    alias ExUbx.Api.Auth, as: AuthApi
    alias ExUbx.Api.Performance, as: PerformanceApi
    alias ExUbx.Api.Struct.Auth, as: AuthStruct
    alias ExUbx.Api.Struct.Performance, as: PerformanceStruct
    alias Poison.Parser, as: JsonParser

    @version Mix.Project.config[:version]

    def version do
        @version
    end

    def fetch_auth do
        response = AuthApi.request_auth_token()
        headers  = response.headers.hdrs

        location = headers["location"]
        cookie   = headers["set-cookie"]

        %AuthStruct{
            location: location,
            cookie: cookie
        }
    end

    def fetch_performance(cookie, event_id) do
        response = PerformanceApi.request_json(cookie, event_id)
        body     = response.body
        data     = JsonParser.parse!(body)

        performances = data["performanceList"]
        status       = data["performanceQuotaStatusList"]

        %PerformanceStruct{
            performances: performances,
            status: status
        }
    end

    def convert_performances(performancce_struct) do
        performances = performancce_struct.performances
        status       = performancce_struct.status

        # performances = for { performance, index } <- Enum.with_index performances do
        #     [] ++ Map.put(performance, "status", Enum.at(status, index))
        # end
        # performances

        # performances
        #     |> Enum.with_index
        #     |> Enum.reduce([], fn { performance, index }, accumulator ->
        #             accumulator ++ [Map.put(performance, "status", Enum.at(status, index))]
        #        end)

        # performances
        #     |> Enum.with_index
        #     |> Enum.map(fn { performance, index } ->
        #             Map.put(performance, "status", Enum.at(status, index))
        #        end)

        # performances
        #     |> Enum.with_index
        #     |> Enum.map(&(Map.put(elem(&1, 0), "status", Enum.at(status, elem(&1, 1)))))

        performances
            |> Stream.with_index
            |> Stream.map(&(Map.put(elem(&1, 0), "status", Enum.at(status, elem(&1, 1)))))
            |> Enum.to_list
    end

end
