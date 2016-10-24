defmodule ExUbx do

    alias ExUbx.Api.Auth, as: AuthApi
    alias ExUbx.Api.Performance, as: PerformanceApi
    alias ExUbx.Api.Struct.Auth, as: AuthStruct

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

    def fetch_performance do

    end

end
