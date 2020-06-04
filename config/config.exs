# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :recipe_box,
  ecto_repos: [RecipeBox.Repo]

# Configures the endpoint
config :recipe_box, RecipeBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b1Lbi1ekp0nSJbr/0cUhZ5VDHLUYiFzZDZ2fg7FMFohHa1DOkiCV/Kh9OcGgaWbw",
  render_errors: [view: RecipeBoxWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RecipeBox.PubSub,
  live_view: [signing_salt: "uWYr/ARv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
