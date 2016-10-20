defmodule ExUbx.Api.Auth do

    alias ExUbx.Api.Base, as: BaseApi

    def request_auth_token do
        BaseApi.get("http://www.urbtix.hk/")
    end

end
