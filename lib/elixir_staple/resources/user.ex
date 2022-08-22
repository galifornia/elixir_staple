defmodule ElixirStaple.User do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "users"
    repo ElixirStaple.Repo
  end

  attributes do
    attribute :email, :string,
      allow_nil?: false,
      constraints: [
        # Note: This regex is just an example
        match: ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i
      ]

    relationships do
      has_many :polls, ElixirStaple.Poll, destination_field: :user_id
    end

    uuid_primary_key :id
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
