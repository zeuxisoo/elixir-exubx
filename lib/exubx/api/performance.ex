defmodule ExUbx.Api.Performance do

    alias ExUbx.Api.Base, as: BaseApi

    def request_json(cookie, event_id, per_page \\ 10, page_no \\ 1) do
        timestamp  = :os.system_time(:seconds)
        target_url = :io_lib.format(
            "https://ticket.urbtix.hk/internet/json/event/~w/performance/~w/~w/perf.json?locale=zh_TW&~w",
            [event_id, per_page, page_no, timestamp]
        )

        BaseApi.get(target_url, [
            headers: [cookie: cookie],
            ibrowse: [
                ssl_options: [
                    verify: :verify_none,

                    # disable ssl_alert.erl:94:Warning: unrecognised name
                    log_alert: false
                ]
            ]
        ])
    end

end
