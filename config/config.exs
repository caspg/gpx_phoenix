# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gpx_phoenix,
  ecto_repos: [GpxPhoenix.Repo]

config :gpx_phoenix, GpxPhoenix.Repo,
  types: GpxPhoenix.PostgresTypes

# Configures the endpoint
config :gpx_phoenix, GpxPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+OXD16VKSetu2G11AkyT7SvYS2DZkGdfF+wCMn4v6CvGDjoUA7pUtcmMyNFjn3Fc",
  render_errors: [view: GpxPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GpxPhoenix.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "UkSFdbGN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
