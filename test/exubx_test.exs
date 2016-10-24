defmodule ExUbxTest do

    use ExUnit.Case

    doctest ExUbx

    test "ExUbx.fetch_auth response is correct" do
        auth = ExUbx.fetch_auth

        assert auth.location != nil
        assert auth.cookie   != nil
    end

    test "ExUbx.fetch_performance response is correct" do
        auth = ExUbx.fetch_auth
        data = ExUbx.fetch_performance(auth.cookie, 30816)

        assert is_list(data.performances)
        assert is_list(data.status)
    end

end
