defmodule ExUbx.Api.Struct.Auth do

    @type t :: %__MODULE__{ location: String.t, cookie: String.t }

    defstruct location: nil, cookie: nil

end
