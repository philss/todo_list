# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :todo_list, ecto_repos: [TodoList.Repo]

import_config "#{Mix.env()}.exs"
