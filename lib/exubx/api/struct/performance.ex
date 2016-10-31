defmodule ExUbx.Api.Struct.Performance do

    @type t :: %__MODULE__{ performances: list, status: list }

    defstruct performances: [], status: []

end
