defmodule ExUbx.Validator do

    def has_auth_token?(auth_struct) do
        location = auth_struct.location
        cookie   = auth_struct.cookie

        location == "https://ticket.urbtix.hk/" && cookie != nil
    end

    def has_performances?(performance_struct) do
        performances = performance_struct.performances
        status       = performance_struct.status

        performances != [] &&  status != []
    end

end
