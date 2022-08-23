defmodule ElixirStaple.Vote do
  use Ash.Resource, data_layer: AshPostgres.DataLayer,
    extensions: [
      AshJsonApi.Resource
    ]

  postgres do
    table "votes"
    repo ElixirStaple.Repo
  end

  json_api do
    type "vote"

    routes do
      base "/votes"

      get :read
      index :read
      post :create
      patch :update
      delete :destroy
    end
  end

  attributes do
    attribute :answers, {:array, :integer}, default: []

    uuid_primary_key :id

    relationships do
      belongs_to :poll, ElixirStaple.Poll
      belongs_to :user, ElixirStaple.User
    end
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
