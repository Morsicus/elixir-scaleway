# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :scaleway,
  api_token: "Secret Token !",
  region: "par1|ams1"

import_config "#{Mix.env}.exs"
