defmodule ExUbx.CLI.Command do

    defmacro __using__(_opts) do
        quote do
            Module.register_attribute(__MODULE__, :shortdoc, persist: true)
        end
    end

end
