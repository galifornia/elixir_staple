defmodule ElixirStaple.Poll do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "polls"
    repo ElixirStaple.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string,
      allow_nil?: false,
      constraints: [max_length: 100]

    attribute :description, :string do
      allow_nil? false
      constraints max_length: 255
    end

    attribute :choices, {:array, :string}, allow_nil?: false, default: []

    attribute :invites, {:array, :uuid}, allow_nil?: false, default: []

    attribute :public, :boolean, allow_nil?: false, default: false

    # This is set on create
    create_timestamp :inserted_at
    # This is updated on all updates
    update_timestamp :updated_at


    relationships do
      has_many :votes, ElixirStaple.Vote, destination_field: :poll_id
      belongs_to :user, ElixirStaple.User
    end
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end
end
