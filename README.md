# ExUbx

A fetch tool for listing the remote ubx performance list.

## Installation

Add as a dependency in your mix.exs file:

```elixir
defp deps do
  [
    { :exubx, "~> 0.1" }
  ]
end
```

And run:

    $ mix deps.get

## Basic Usage

To run `ExUbx` in the current project:

    $ mix ubx list --event=[EVENT_ID]

## Other Usage

You can play `ExUbx` in the Elixir REPL, Please ensure this command excute in the root of your project:

    $ iex -S mix

Example (fetch auth token):

    iex> auth = ExUbx.fetch_auth()

    %ExUbx.Api.Struct.Auth{cookie: "Auth_Token=201610311227-12345678a12aa496bde94ec7de16f3f01adc6c5a; HttpOnly; Domain=example.com; Expires=Mon, 31-Oct-2016 05:27:12 GMT; Path=/", location: "https://ticket.example.com/"}

Example (fetch performance list):

    iex> performance = ExUbx.fetch_performance(auth.cookie, 30816)

    %ExUbx.Api.Struct.Performance{performances: [%{"bookmarkCreateTime" => -1,
        "bookmarkStatus" => 0, "counterSalesEndDate" => nil,
        "counterSalesStartDate" => nil, "displayDate" => true,
        "displayTime" => true, "eventId" => 30816, "externalReferenceKey" => "",
        "isFirstDayPerformance" => false, "isInCounterSalesPeriod" => true,
        "isNotAllowedToPurchaseBeforeShowTime" => false, "isPurchasable" => true,
        "note" => nil, "performanceAcsId" => 293477,
        "performanceCategoryClass" => "-", "performanceDateTime" => 1480074300000,
        "performanceDisplayFormat" => "DISPLAY_NAME_DATE_AND_TIME",
        "performanceDisplayFormatValue" => 1, "performanceId" => 101254,
        "performanceName" => "This is a example performance name",
        "transactionMaxQuota" => 40},
        ......
        ......
        ......
      ],
     status: ["AVAILABLE", "AVAILABLE", "AVAILABLE", "AVAILABLE", "AVAILABLE"]}

Example (convert performances for mix the performances and status)

    iex> ExUbx.convert_performances(performance)

    [%{"bookmarkCreateTime" => -1, "bookmarkStatus" => 0,
       "counterSalesEndDate" => nil, "counterSalesStartDate" => nil,
       "displayDate" => true, "displayTime" => true, "eventId" => 30816,
       "externalReferenceKey" => "", "isFirstDayPerformance" => false,
       "isInCounterSalesPeriod" => true,
       "isNotAllowedToPurchaseBeforeShowTime" => false, "isPurchasable" => true,
       "note" => nil, "performanceAcsId" => 293477,
       "performanceCategoryClass" => "-", "performanceDateTime" => 1480074300000,
       "performanceDisplayFormat" => "DISPLAY_NAME_DATE_AND_TIME",
       "performanceDisplayFormatValue" => 1, "performanceId" => 101254,
       "performanceName" => "This is a example performance name",
       "status" => "AVAILABLE", "transactionMaxQuota" => 40},
     ......
     ......
     ......]

## Documentation

You can find in [Here](https://hexdocs.pm/exubx)
