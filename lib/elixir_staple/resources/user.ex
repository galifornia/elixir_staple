defmodule ElixirStaple.User do
  use Ash.Resource, data_layer: AshPostgres.DataLayer,
    extensions: [
      AshJsonApi.Resource
    ]

  postgres do
    table "users"
    repo ElixirStaple.Repo
  end

  json_api do
    type "user"

    routes do
      base "/users"

      get :read
      index :read
      post :create
      patch :update
      delete :destroy
    end
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
      has_many :votes, ElixirStaple.Vote, destination_field: :user_id
    end

    uuid_primary_key :id
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
