defmodule ExUbx do

    alias ExUbx.Api.Auth, as: AuthApi
    alias ExUbx.Api.Performance, as: PerformanceApi
    alias ExUbx.Api.Struct.Auth, as: AuthStruct
    alias ExUbx.Api.Struct.Performance, as: PerformanceStruct
    alias Poison.Parser, as: JsonParser

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

end
