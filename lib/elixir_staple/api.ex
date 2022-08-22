defmodule ElixirStaple.Api do
  use Ash.Api

  resources do
    registry ElixirStaple.Registry
  end
end
