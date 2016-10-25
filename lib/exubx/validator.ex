defmodule ExUbx.Validator do

    def is_valid_auth_token(auth_struct) do
        location = auth_struct.location
        cookie   = auth_struct.cookie

        location == "https://ticket.urbtix.hk/" && cookie != nil
    end

end
