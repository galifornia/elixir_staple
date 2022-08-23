defmodule ElixirStaple.Vote do
  use Ash.Resource

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
