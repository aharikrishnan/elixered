# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :red,
  ecto_repos: [Red.Repo]

# Configures the endpoint
config :red, RedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dP+6NoULkMblFjeUOhE8O7wgVo6okDrM0cm3kDF4Fh+Wecg/mmDYlRvIWFRdJQaF",
  render_errors: [view: RedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Red.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
