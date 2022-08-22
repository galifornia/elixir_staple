defmodule ElixirStaple.Registry do
  use Ash.Registry,
    extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry ElixirStaple.User
    entry ElixirStaple.Poll
    entry ElixirStaple.Vote
  end
end
