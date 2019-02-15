defmodule ExUbx do
    @moduledoc """
    The base module of ExUbx.

    A `ExUbx` module to provide the a basic method for other module to call.
    """

    alias ExUbx.Api.Auth, as: AuthApi
    alias ExUbx.Api.Performance, as: PerformanceApi
    alias ExUbx.Api.Struct.Auth, as: AuthStruct
    alias ExUbx.Api.Struct.Performance, as: PerformanceStruct
    alias Poison.Parser, as: JsonParser

    @type auth_struct_t :: AuthStruct.t
    @type performance_struct_t :: PerformanceStruct.t

    @version Mix.Project.config[:version]

    @doc false
    def version do
        @version
    end

    @doc "Return `ExUbx.Api.Struct.Auth` struct included cookie and location"
    @spec fetch_auth() :: auth_struct_t
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

    @doc "Return `ExUbx.Api.Struct.Performance` struct included performances and status"
    @spec fetch_performance(term, integer) :: performance_struct_t
    def fetch_performance(cookie, event_id) do
        response = PerformanceApi.request_json(cookie, event_id)
        body     = response.body
        data     = JsonParser.parse!(body, %{})

        performances = data["performanceList"]
        status       = data["performanceQuotaStatusList"]

        %PerformanceStruct{
            performances: performances,
            status: status
        }
    end

    @doc "Return converted performance list by mixing performance and status"
    @spec convert_performances(performance_struct_t) :: list
    def convert_performances(performance_struct) do
        performances = performance_struct.performances
        status       = performance_struct.status

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
