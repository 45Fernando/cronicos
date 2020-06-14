defmodule Cronicos.Repo do
  use Ecto.Repo,
    otp_app: :cronicos,
    adapter: Ecto.Adapters.Postgres
end
