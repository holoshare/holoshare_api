# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :holoshare_api,
  ecto_repos: [HoloshareApi.Repo]

# Configures the endpoint
config :holoshare_api, HoloshareApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3r7kS2+L9yUSahSPoTdogHcKOvQXoheGZ4x7l2uUaE4YceTAhSSWNlBGA7ECo93B",
  render_errors: [view: HoloshareApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HoloshareApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
