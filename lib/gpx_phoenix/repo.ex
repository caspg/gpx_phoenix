defmodule GpxPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :gpx_phoenix,
    adapter: Ecto.Adapters.Postgres
end
