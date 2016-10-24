defmodule ExUbxTest do

    use ExUnit.Case

    doctest ExUbx

    test "test ExUbx.fetch_auth response is correct" do
        auth = ExUbx.fetch_auth

        assert auth.location != nil
        assert auth.cookie   != nil
    end

end
