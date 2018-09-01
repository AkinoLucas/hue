# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hue,
  ecto_repos: [Hue.Repo]

# Configures the endpoint
config :hue, Hue.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oX+r6Hztgd/L9HDztEdDYBan5GOdU0v3DIq8+jHdsISPeWrLN1/V0JJLUFg5+ojx",
  render_errors: [view: Hue.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hue.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
