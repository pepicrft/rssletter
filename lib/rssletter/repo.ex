defmodule Rssletter.Repo do
  use Ecto.Repo,
    otp_app: :rssletter,
    adapter: Ecto.Adapters.Postgres
end
