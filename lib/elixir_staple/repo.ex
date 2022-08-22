defmodule ElixirStaple.Repo do
  use Ecto.Repo,
    otp_app: :elixir_staple,
    adapter: Ecto.Adapters.Postgres

    def installed_extensions do
      ["uuid-ossp"]
    end
end
