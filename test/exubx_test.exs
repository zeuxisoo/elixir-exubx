defmodule ExUbxTest do

    use ExUnit.Case

    doctest ExUbx

    @event_id 37672

    test "ExUbx.fetch_auth response is correct" do
        auth = ExUbx.fetch_auth

        assert auth.location != nil
        assert auth.cookie   != nil
    end

    test "ExUbx.fetch_performance response is correct" do
        auth = ExUbx.fetch_auth
        data = ExUbx.fetch_performance(auth.cookie, @event_id)

        assert is_list(data.performances)
        assert is_list(data.status)
    end

    test "ExUbx.convert_performances response is correct" do
        auth   = ExUbx.fetch_auth
        data   = ExUbx.fetch_performance(auth.cookie, @event_id)
        events = ExUbx.convert_performances(data)

        assert is_list(events)
    end

end
