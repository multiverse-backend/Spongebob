defmodule SpongebobApi.Repo do
  use Ecto.Repo,
    otp_app: :spongebob_api,
    adapter: Ecto.Adapters.Postgres
end
