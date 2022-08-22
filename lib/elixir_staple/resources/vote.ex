defmodule ElixirStaple.Vote do
  use Ash.Resource

  attributes do
    attribute :email, :string,
      allow_nil?: false,
      constraints: [
        # Note: This regex is just an example
        match: ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i
      ]

    uuid_primary_key :id

    relationships do
      belongs_to :poll, ElixirStaple.Poll
    end
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
