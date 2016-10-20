defmodule ExUbx do

    alias ExUbx.Api.Auth, as: AuthApi

    def fetch_auth do
        response = AuthApi.request_auth_token()
        headers  = response.headers.hdrs
        location = headers["location"]

        location == "https://ticket.urbtix.hk/"
    end

    def fetch_performance do

    end

end
