defmodule ElixirStaple.Repo.Migrations.MigrateResources1 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:votes, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :poll_id, :uuid
    end

    create table(:users, primary_key: false) do
      add :email, :text, null: false
      add :id, :uuid, null: false, primary_key: true
    end

    create table(:polls, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
    end

    alter table(:votes) do
      modify :poll_id, references(:polls, column: :id, name: "votes_poll_id_fkey", type: :uuid)
    end

    alter table(:polls) do
      add :title, :text, null: false
      add :description, :text, null: false
      add :choices, {:array, :text}
      add :public, :boolean, null: false, default: false
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :user_id, references(:users, column: :id, name: "polls_user_id_fkey", type: :uuid)
    end
  end

  def down do
    drop constraint(:polls, "polls_user_id_fkey")

    alter table(:polls) do
      remove :user_id
      remove :updated_at
      remove :inserted_at
      remove :public
      remove :choices
      remove :description
      remove :title
    end

    drop constraint(:votes, "votes_poll_id_fkey")

    alter table(:votes) do
      modify :poll_id, :uuid
    end

    drop table(:polls)

    drop table(:users)

    drop table(:votes)
  end
end
